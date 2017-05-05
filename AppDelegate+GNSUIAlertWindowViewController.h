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

@end




@interface GNSUIAlertWindowViewController : UIViewController

@property (strong, nonatomic) UIViewController * _Nullable windowviewcntl_presented;
@property (strong, nonatomic) UIView* _Nullable alertView_ ;
@property (strong, nonatomic) UILabel* _Nullable  alertView_label;
@property (strong, nonatomic) NSMutableArray <UIButton *>* _Nullable actionsBtns ;
@property (strong, nonatomic) NSMutableArray <UIAlertAction *> * _Nullable _actions;
@property (nonatomic) BOOL dismissAtClick;


-(void)showMessage:(nullable NSString*)message title:(nullable NSString*)title withActions:(nullable id )actions completion:(void ( ^ _Nullable ) (_Nullable id actionHandler)) completionEvent :(nullable id)usePersonnalisedParams  presentationStyle:(UIAlertControllerStyle) style;

-(nullable NSArray*)buttons;
-(nullable NSArray*)actions;

-(void) invokeSender:(_Nullable id) sender;

-(void)addAction:(nullable UIAlertAction *)action;

@end

