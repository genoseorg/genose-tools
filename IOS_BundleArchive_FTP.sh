#!/bin/bash

declare -a XCODE_OPENED_PROJECTS


CFBundleShortVersionString_buildnumber="1"



XCODE_OPENED_PROJECTS=$( osascript -e 'tell application "XCode" to get path of active workspace Document' | sort | uniq | sed -e "s;\, ;:;g" | tr ":" "\n" | grep -i ".xc" | uniq | sort | sed -e "s;\ ;:;g" | tr ":" "\n" )

if  [ ${#XCODE_OPENED_PROJECTS} -lt 5 ]; then
echo " Warning XCODE_OPENED_PROJECTS  :: ${PRODUCT_NAME} "
XCODE_OPENED_PROJECTS=$( osascript -e 'tell application "XCode" to get path of  Documents' | sort | uniq | sed -e "s;\, ;:;g" | tr ":" "\n" | grep -i ".xcw" | uniq | sort | sed -e "s;\ ;:;g" | tr ":" "\n" )
fi



nbProject_XCODE_OPENED_PROJECTS=$( echo ${XCODE_OPENED_PROJECTS} | sed -e "s;\ ;:;g" | tr ":" "\n" | wc -l | awk '{ if(length($1)){print $1}}' )

let "nbProject_XCODE_OPENED_PROJECTS= nbProject_XCODE_OPENED_PROJECTS+0"

echo " ********** YOU currently work on project :: (" ${nbProject_XCODE_OPENED_PROJECTS} " projects ) "
echo ${XCODE_OPENED_PROJECTS} | sed -e "s;\ ;:;g" | tr ":" "\n"
if [ ${nbProject_XCODE_OPENED_PROJECTS} -gt 1 ]; then
echo " ********** PLEASE Close ONE or MORE You don t USE  ************"
exit
fi

if [ ${#PRODUCT_NAME} -lt 5 ] && [ ${#XCODE_OPENED_PROJECTS} -gt 5 ]; then

echo " Warning PRODUCT_NAME  :: ${PRODUCT_NAME} "

XCODE_OPENED_PROJECTS_NAME=$( basename $( echo "${XCODE_OPENED_PROJECTS}" )  | sed -e "s;.xc;:;g" | tr ":" "\n" | head -1 )
XCODE_OPENED_PROJECTS=$( dirname $( echo "${XCODE_OPENED_PROJECTS}" )  )




INFOPLIST_FILE=$( find $( echo "${XCODE_OPENED_PROJECTS}/" )  -maxdepth 2 -iname info.plist | grep -vi ".framework" | grep -vi "test" )

PRODUCT_NAME=$( /usr/libexec/PlistBuddy -c "Print CFBundleName" "${INFOPLIST_FILE}" )

PROJECT_FILE_PATH=${XCODE_OPENED_PROJECTS}
CFBundleShortVersionString=$( /usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${INFOPLIST_FILE}" )
CFBundleVersion=$( /usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${INFOPLIST_FILE}" )

PRODUCT_NAME=$( echo  $PRODUCT_NAME | grep -v "(" )



if [ ${#PRODUCT_NAME} -lt 5 ]; then
echo " Warning done with PRODUCT_NAME  :: ${PRODUCT_NAME} : : replacing by ${XCODE_OPENED_PROJECTS_NAME}"
PRODUCT_NAME=${XCODE_OPENED_PROJECTS_NAME}
fi
CFBundleName="${PRODUCT_NAME}"
fi




if [ ${#PRODUCT_NAME} -lt 5 ]; then

echo " Error PRODUCT_NAME  :: ${PRODUCT_NAME} "
exit 255
fi


PROJECT_FILE_PATH=$(echo ${PROJECT_FILE_PATH}  )

if [ ${#PROJECT_FILE_PATH} -lt 5 ]; then
PROJECT_FILE_PATH="${HOME}/Documents/github/"
echo " Warning PROJECT_FILE_PATH  :: ${PROJECT_FILE_PATH} "

# ## $( | sed -e "s;\ ;:;g" | tr ":" "\n" | sort | uniq )

PROJECT_FILE_PATH=$( find $( find "${PROJECT_FILE_PATH}"  -maxdepth 3 -iname "${PRODUCT_NAME}.xcodeproj" -exec dirname {}  \; )  -maxdepth 1 -iname "${PRODUCT_NAME}" -type d -mtime -4h    | sort | uniq )


echo " Warning PROJECT_FILE_PATH  :: ${PROJECT_FILE_PATH} "
exit 255
# ## find


fi


INFOPLIST_FILE="${PRODUCT_SETTINGS_PATH}"


CFBundleShortVersionString=$(echo ${CFBundleShortVersionString}  )


if [ ${#CFBundleShortVersionString} -lt 5 ]; then
CFBundleShortVersionString="1.0.0"
echo " Warning Version  :: ${CFBundleShortVersionString} "

INFOPLIST_FILE=$( find "${PROJECT_FILE_PATH}" -maxdepth 1 -iname info.plist )

echo "do path ${INFOPLIST_FILE}"

if [ ${#INFOPLIST_FILE} -gt 4 ] && [ -f ${INFOPLIST_FILE} ] ; then
CFBundleShortVersionString=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${INFOPLIST_FILE}")
else
echo "error path ${INFOPLIST_FILE}"
fi

echo " Warning done Version  :: ${CFBundleShortVersionString} "

fi

lastPWD_EX=$(pwd)

cd /private/tmp/volatile_hd ||  echo "ERROR RAMDISK NOT FOUND" ||  exit 255

rm  -v ${PRODUCT_NAME}*.zip
rm  -rf "${PRODUCT_NAME}_V${CFBundleShortVersionString}"

mkdir -pv ${PRODUCT_NAME}_V${CFBundleShortVersionString}
mkdir -pv ${PRODUCT_NAME}_V${CFBundleShortVersionString}/${PRODUCT_NAME}_V${CFBundleShortVersionString}_sources

echo "* ******************************************************** *"
echo "* ****************** COPY LASTEST IPA ************************** *"
echo "* ******************************************************** *"
IPA_FOUND_PATH=$(find ${HOME}/Documents/Archive_IPA/APPLESTORE/ -iname *.ipa -mtime -8h | head -1 )
echo " ;;;; " ${IPA_FOUND_PATH}
if [ ${#IPA_FOUND_PATH} -lt  5 ]; then

echo " ERROR :: NO IPA Found nor build since last Hours (4H) "

exit
else



dir_IPA_FOUND_PATH=$( dirname "${IPA_FOUND_PATH}" )
cd "${dir_IPA_FOUND_PATH}"

rm -rf Payload
rm -rf Symbols

unzip -q "${PRODUCT_NAME}.ipa" 1>&2 2>/dev/null

CFBundleName_cmp=$( /usr/libexec/PlistBuddy -c "Print CFBundleName" "${dir_IPA_FOUND_PATH}/Payload/${PRODUCT_NAME}.app/Info.plist" )
CFBundleShortVersionString_cmp=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${dir_IPA_FOUND_PATH}/Payload/${PRODUCT_NAME}.app/Info.plist")
CFBundleVersion_cmp=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${dir_IPA_FOUND_PATH}/Payload/${PRODUCT_NAME}.app/Info.plist")

rm -rf Payload
rm -rf Symbols


cmp_name=$( echo "${CFBundleName_cmp}" | grep -i "${CFBundleName}" )
cmp_version=$( echo "${CFBundleShortVersionString_cmp}" | grep -i "${CFBundleShortVersionString}" )
cmp_version_rev_build=$( echo "${CFBundleVersion_cmp}" | grep -i "${CFBundleVersion}" )
if [ ${#cmp_name} -gt 0 ] &&  [ ${#cmp_version} -gt 0 ] &&  [ ${#cmp_version_rev_build} -gt 0 ] ; then
echo " Valid IPA :  ${IPA_FOUND_PATH} "
echo " Version Project : ${CFBundleName}  :: Found :: ${CFBundleName_cmp} "
echo " Version Project : ${CFBundleShortVersionString}  :: Found :: ${CFBundleShortVersionString_cmp} "
echo " Version Project : ${CFBundleVersion}  :: Found :: ${CFBundleVersion_cmp} "
else
echo " ERROR :: NO Matching Version IPA Found : "
echo " Version Project : ::${CFBundleName}:: Found ::${CFBundleName_cmp}::"
echo " Version Project : ::${CFBundleShortVersionString}::  :: Found ::${CFBundleShortVersionString_cmp}::"
echo " Version Project : ::${CFBundleVersion}::  :: Found ::${CFBundleVersion_cmp}:: "
exit 255
fi
fi

cd /private/tmp/volatile_hd

cp -rv "${IPA_FOUND_PATH}" "${PRODUCT_NAME}_V${CFBundleShortVersionString}/${PRODUCT_NAME}.ipa"
# ## && test -f "${PRODUCT_NAME}_V${CFBundleShortVersionString}/${PRODUCT_NAME}.ipa"  ||  true && ( echo "ERROR copy IPA"  && echo "---"  ) && exit 255

if [ ! -f "${PRODUCT_NAME}_V${CFBundleShortVersionString}/${PRODUCT_NAME}.ipa" ] ; then

echo "ERROR copy IPA"
echo "---"
exit 255

fi

echo "* ******************************************************** *"
echo "* ****************** COPY SOURCES ***************************** *"
echo "* ******************************************************** *"




cp -rp ${PROJECT_FILE_PATH}/*  ${PRODUCT_NAME}_V${CFBundleShortVersionString}/${PRODUCT_NAME}_V${CFBundleShortVersionString}_sources/ ||  true && ( echo "ERROR copy sources" && echo "---"  ) && exit 255



echo "* ******************************************************** *"
echo "* ****************** Archiving SOURCES ***************************** *"
echo "* ******************************************************** *"

cd ${PRODUCT_NAME}_V${CFBundleShortVersionString}
zip -rq  ${PRODUCT_NAME}_V${CFBundleShortVersionString}_sources.zip ${PRODUCT_NAME}_V${CFBundleShortVersionString}_sources   ||  true && ( echo "ERROR Archiving sources"  && echo "---"  ) && exit 255
rm  -rf ${PRODUCT_NAME}_V${CFBundleShortVersionString}_sources
cd ..

echo "* ******************************************************** *"
echo "* ****************** Cleaning AND SIGN ************************* *"
echo "* ******************************************************** *"
find . -type f -name ".DS*" -print -exec rm -v {} \;
echo "* ******************************************************** *"
echo "* ******************************************************** *"
echo "* ******************************************************** *"
openssl sha1 ${PRODUCT_NAME}_V${CFBundleShortVersionString}/${PRODUCT_NAME}_V${CFBundleShortVersionString}_sources.zip > ${PRODUCT_NAME}_V${CFBundleShortVersionString}/signature_ipa.txt   || true && ( echo "ERROR Sign sources"  && echo "---"  ) && exit 255
openssl sha1 ${PRODUCT_NAME}_V${CFBundleShortVersionString}/${PRODUCT_NAME}.ipa  >> ${PRODUCT_NAME}_V${CFBundleShortVersionString}/signature_ipa.txt   ||  true && ( echo "ERROR Sign IPA"  && echo "---"  ) && exit 255

echo "* ******************************************************** *"
echo "* ******************** COPY For FTP ****************** *"
echo "* ******************************************************** *"
zip -rq  ${PRODUCT_NAME}_V${CFBundleShortVersionString}\ iOS.zip ${PRODUCT_NAME}_V${CFBundleShortVersionString} ||  true && ( echo "ERROR Archiving prep FTP "  && echo "---"  ) && exit 255
echo "* ******************************************************** *"
echo "* ******************************************************** *"
echo "* ******************************************************** *"

rm  -rf ${PRODUCT_NAME}_V${CFBundleShortVersionString}
mkdir -pv ${PRODUCT_NAME}_V${CFBundleShortVersionString}
mv ${PRODUCT_NAME}_V${CFBundleShortVersionString}\ iOS.zip ${PRODUCT_NAME}_V${CFBundleShortVersionString}/

echo ".... Clear ... "
open ${PRODUCT_NAME}_V${CFBundleShortVersionString}
cd ${lastPWD_EX}
