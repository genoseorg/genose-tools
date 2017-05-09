//
//  AppDelegate+GNSUIAlertWindowViewController.h
//
//
//  Created by Sebastien COTILLARD on 04/05/2017.
//  Copyright © 2017 Sebastien COTILLARD. All rights reserved.
//

#import "AppDelegate.h"

@interface  AppDelegate (GNSUIAlertWindowViewController_UIALERT)



-(void)showMessage:(nullable NSString *)message;
-(void)showMessage:(nullable NSString *)message  presentationStyle:(UIAlertControllerStyle) style;

-(void)showMessage:(nullable NSString *)message title:(nullable NSString*)title;
-(void)showMessage:(nullable NSString *)message title:(nullable NSString*)title  presentationStyle:(UIAlertControllerStyle) style;



-(void)showMessage:(nullable NSString*)message title:(nullable NSString*)title withActions:(nullable id )actions completion:(void ( ^ _Nullable ) (_Nullable id actionHandler)) completionEvent :(nullable id)usePersonnalisedParams;
-(void)showMessage:(nullable NSString*)message title:(nullable NSString*)title withActions:(nullable id )actions completion:(void ( ^ _Nullable ) (_Nullable id actionHandler)) completionEvent :(nullable id)usePersonnalisedParams  presentationStyle:(UIAlertControllerStyle) style;

-(id)alert;
@end




@interface GNSUIAlertWindowViewController : UIViewController

@property (strong, nonatomic) UIViewController * _Nullable windowviewcntl_presented;
@property (strong, nonatomic) UIView* _Nullable alertView_ ;
@property (strong, nonatomic) UILabel* _Nullable  alertView_message;
@property (strong, nonatomic) UILabel* _Nullable  alertView_title;
@property (strong, nonatomic) id _Nullable  alertView_icon;

@property (strong, nonatomic) NSMutableArray <UIButton *>* _Nullable actionsBtns ;
@property (strong, nonatomic) NSMutableArray <id  >* _Nullable actionsBtnsColor ;
@property (strong, nonatomic) NSMutableArray <UIAlertAction *> * _Nullable _actions;
/* **
 NSArray of NSString, represent @"YES" or @"NO"
 */
@property (strong, nonatomic) NSMutableArray <NSString *> * _Nullable _actionsDissmeable;


@property (nonatomic, readonly) UIAlertControllerStyle ui_preferredStyle;


@property (nonatomic) BOOL dismissAtClick;


-(void)showMessage:(nullable NSString*)message title:(nullable NSString*)title withActions:(nullable id )actions completion:(void ( ^ _Nullable ) (_Nullable id actionHandler)) completionEvent :(nullable id)usePersonnalisedParams  presentationStyle:(UIAlertControllerStyle) style;

-(nullable NSArray*)buttons;
-(nullable NSArray*)actions;

-(void) invokeSender:(_Nullable id) sender;

-(void)addAction:(nullable UIAlertAction *)action;
// NSArray don't store BOOL type, so we use it's representation
-(void)addAction:(nullable UIAlertAction *)action :(  NSString* _Nullable )shouldBtnDoDismiss;

-(_Nonnull id)delegate;

-(void)setAlertView_message:(nullable NSAttributedString*)message;
-(void)setAlertView_title:(nullable NSAttributedString*)message;

-(id _Nullable)label;
-(id _Nullable)message;
-(id _Nullable)alertView_icon;

@end
@interface UIColor (ColorTextForeGroundColor)

- (UIColor  * _Nonnull )readableForegroundColorForBackgroundColor:(UIColor*)backgroundColor;
@end
