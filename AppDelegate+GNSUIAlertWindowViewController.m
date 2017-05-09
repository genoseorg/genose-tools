//
//  AppDelegate+GNSUIAlertWindowViewController.m
//
//
//  Created by Sebastien COTILLARD on 04/05/2017.
//  Copyright © 2017 Sebastien COTILLARD. All rights reserved.
//

#import "AppDelegate+GNSUIAlertWindowViewController.h"


static GNSUIAlertWindowViewController *alertViewController;




@implementation AppDelegate (GNSUIAlertWindowViewController_UIALERT)

-(void)showMessage:(NSString*)message
{
    [self showMessage:message title:nil withActions:nil completion:nil :nil];
}

-(void)showMessage:(NSString*)message presentationStyle:(UIAlertControllerStyle) style
{
    if(alertViewController ==nil) alertViewController = [[GNSUIAlertWindowViewController alloc]init];
    [alertViewController showMessage:message title:nil withActions:nil completion:nil :nil presentationStyle:style];
}


-(void)showMessage:(NSString*)message title:(NSString*)title
{
    if(alertViewController ==nil) alertViewController = [[GNSUIAlertWindowViewController alloc]init];
    [alertViewController showMessage:message title:title withActions:nil completion:nil :nil presentationStyle:UIAlertControllerStyleActionSheet];
    
}

-(void)showMessage:(NSString*)message title:(NSString*)title  presentationStyle:(UIAlertControllerStyle) style
{
    
    if(alertViewController ==nil) alertViewController = [[GNSUIAlertWindowViewController alloc]init];
    [alertViewController showMessage:message title:title withActions:nil completion:nil :nil presentationStyle:style];
}


-(void)showMessage:(NSString*)message title:(nullable NSString*)title withActions:(nullable id )actions completion:(void ( ^ _Nullable ) (_Nullable id actionHandler)) completionEvent :(nullable id)usePersonnalisedParams
{
    if(alertViewController ==nil) alertViewController = [[GNSUIAlertWindowViewController alloc]init];
    [alertViewController showMessage:message title:title withActions:actions completion:completionEvent :usePersonnalisedParams presentationStyle:UIAlertControllerStyleActionSheet];
}

-(void)showMessage:(NSString*)message title:(nullable NSString*)title withActions:(nullable id )actions completion:(void ( ^ _Nullable ) (_Nullable id actionHandler)) completionEvent :(nullable id)usePersonnalisedParams  presentationStyle:(UIAlertControllerStyle) style
{
    if(alertViewController ==nil) alertViewController = [[GNSUIAlertWindowViewController alloc]init];
    [alertViewController showMessage:message title:title withActions:actions completion:completionEvent :usePersonnalisedParams presentationStyle:style];
}

-(id)alert
{
    if(alertViewController ==nil) alertViewController = [[GNSUIAlertWindowViewController alloc]init];
    return alertViewController;
}
@end

@interface GNSUIAlertWindowViewController ()

@end

@implementation GNSUIAlertWindowViewController

@synthesize     dismissAtClick;

@synthesize     windowviewcntl_presented;
@synthesize     alertView_;
@synthesize     alertView_message;
@synthesize     alertView_icon;
@synthesize     alertView_title;

@synthesize     actionsBtns;
@synthesize     _actions;
@synthesize     _actionsDissmeable;

@synthesize     ui_preferredStyle;
@synthesize     actionsBtnsColor;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


-(void)showMessage:(nullable NSString*)message title:(nullable NSString*)title withActions:(nullable id )actions completion:(void ( ^ _Nullable ) (_Nullable id actionHandler)) completionEvent :(nullable id)usePersonnalisedParams  presentationStyle:(UIAlertControllerStyle) style
{
    
    
    if(alertViewController ==nil) alertViewController = self;
    if(actionsBtns == nil) actionsBtns = [NSMutableArray array];
    if(_actions == nil) _actions = [NSMutableArray array];
    if(_actionsDissmeable == nil) _actionsDissmeable = [NSMutableArray array];
    
    [actionsBtns removeAllObjects];
    [_actions removeAllObjects];
    [_actionsDissmeable removeAllObjects];
    
    @try {
        dismissAtClick = YES;
        title = ((title == nil)?@"Information":title);
        message = ((message == nil)?@"...":message);
        
        ui_preferredStyle = UIAlertControllerStyleActionSheet ; // :: UIAlertControllerStyleActionSheet; // :: UIAlertControllerStyleAlert
        
        /* ************** ************** ************** ************** ************** */
        
        /* ************** ************** ************** ************** ************** */
        
        
        id action_forwardArg_argBlockInvoke, action_forwardArg_argSelector, action_forwardArg_argClass = nil;
        
        id action_argType = nil;
        bool action_argType_valid = NO;
        
        /* ************** ************** ************** ************** ************** */
        
        /* ************** ************** ************** ************** ************** */
        
        
        id rootView = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        
        id windowview = [[UIApplication sharedApplication] windows];
        id alertViewController_showed = self;
        /* ************** ************** ************** ************** ************** */
        
        /* ************** ************** ************** ************** ************** */
        
        
        if([windowview count] == 0)
        {
            [NSException raise:NSInternalInconsistencyException format:@" Erreur :: NO Avail window app ...."];
            
            // :: return;
        }
        
        /* ************** ************** ************** ************** ************** */
        
        /* ************** ************** ************** ************** ************** */
        
        
        UIWindow *viewcntl = [windowview objectAtIndex:0];
        UIViewController *windowviewcntl = [viewcntl rootViewController];
        windowviewcntl_presented =      windowviewcntl.presentedViewController;
        
        /* ************** ************** ************** ************** ************** */
        
        /* ************** ************** ************** ************** ************** */
        
        
        if(windowviewcntl_presented == nil && windowviewcntl != nil)
        {
            windowviewcntl_presented = windowviewcntl;
            
            
            
        }else if (windowviewcntl == nil){
            
            [NSException raise:NSInternalInconsistencyException format:@" Erreur :: NO Avail window view controller ...."];
        }else if ( rootView == windowviewcntl ){
            //:: windowviewcntl_presented = windowviewcntl;;
            ;;
            // [ alertViewController presentViewController:alertViewController animated:YES completion:nil];
            // :: ui_preferredStyle = UIAlertControllerStyleAlert;
            
        }
        
        
        /* ************** ************** ************** ************** ************** */
        
        /* ************** ************** ************** ************** ************** */
        
        
        // UIAlertController * alertViewController = nil;
        if( ((BOOL)usePersonnalisedParams) != NO && ![usePersonnalisedParams isKindOfClass: [NSDictionary class] ] ){
            [NSException raise:NSInvalidArgumentException format:@" Erreur :: actions type (%@) is not acceptable argument ....", action_argType];
        }else if (((BOOL)usePersonnalisedParams) != NO && [usePersonnalisedParams isKindOfClass: [NSDictionary class] ]
                  && (BOOL)[usePersonnalisedParams objectForKey:@"usePersonnalisedParams"]
                  && [ [usePersonnalisedParams objectForKey:@"usePersonnalisedParams"] isKindOfClass: [NSString class] ]
                  && [ [usePersonnalisedParams objectForKey:@"usePersonnalisedParams"] isEqualToString: @"YES"]
                  ){
            
            // :: Build Alert View
            alertViewController = self;// ::[[UIViewController alloc] init];
            alertViewController_showed = self;
            alertView_ = [ [((UIViewController*)rootView) view] viewWithTag: 2100 ];
            // ::
            if(alertView_ == nil ){
                alertView_ = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds] ];
                [[((UIViewController*)rootView) view] addSubview:alertView_];
            }
            
            [alertView_ setTag:2100];
            
            [alertView_ setFrame:[[UIScreen mainScreen] bounds] ];
            
            [alertView_ setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.8]] ; // :: [UIColor colorWithHue:0.6 saturation:0.8 brightness:0.8 alpha:0.8];
            
            int widthlable =  (  CGRectGetWidth([[UIScreen mainScreen] bounds] ) - 40 );
            
            
            
            alertView_icon = [[UILabel alloc] initWithFrame:CGRectMake(  ( CGRectGetWidth([[UIScreen mainScreen] bounds] ) / 2) - ( widthlable / 2 ) , 40 , widthlable , 120)];
            
            
            
            alertView_title = [[UILabel alloc] initWithFrame:CGRectMake(  ( CGRectGetWidth([[UIScreen mainScreen] bounds] ) / 2) - ( widthlable / 2 ) , CGRectGetHeight([alertView_icon frame]) +40 , widthlable , 120)];
            
            alertView_title.backgroundColor = [UIColor clearColor];
            alertView_title.textColor = [UIColor colorWithWhite:0.1 alpha:1.0];
            alertView_title.font = [UIFont boldSystemFontOfSize: 17];
            alertView_title.text = title;
            alertView_title.numberOfLines = 1;
            alertView_title.textAlignment = NSTextAlignmentCenter;
            
            
            alertView_message = [[UILabel alloc] initWithFrame:CGRectMake(  ( CGRectGetWidth([[UIScreen mainScreen] bounds] ) / 2) - ( widthlable / 2 ) , CGRectGetHeight([alertView_title frame]) +40 , widthlable , 120)];
            alertView_message.backgroundColor = [UIColor clearColor];
            alertView_message.textColor = [UIColor colorWithWhite:0.1 alpha:1.0];
            alertView_message.font = [UIFont boldSystemFontOfSize: 17];
            alertView_message.text = message;
            alertView_message.numberOfLines = 4;
            alertView_message.textAlignment = NSTextAlignmentCenter;
            
            
            
            [alertView_ addSubview: alertView_icon];
            
            [alertView_ addSubview: alertView_title];
            
            [alertView_ addSubview: alertView_message];
            
            [alertViewController setView: alertView_];
            
            actionsBtnsColor = [usePersonnalisedParams objectForKey:@"UIControlColor"];
            actionsBtnsColor = ( (actionsBtnsColor == nil)? [NSMutableArray array]: actionsBtnsColor);
            
        }else{
            alertViewController_showed =  (id)   [UIAlertController
                                                  alertControllerWithTitle: title
                                                  message:message
                                                  preferredStyle:ui_preferredStyle];
            
            
        }
        
        // ::  NSLog(@" dismiss  ?? ::: %@ ", [usePersonnalisedParams objectForKey:@"dismissViewControllerAnimated"]);
        id dismissableBtnsPrefs = nil;
        if ( ((BOOL)usePersonnalisedParams) != NO && [usePersonnalisedParams isKindOfClass: [NSDictionary class] ] && (nil != [usePersonnalisedParams objectForKey:@"dismissViewControllerAnimated"] ) ){
            
            if(  ([  [usePersonnalisedParams objectForKey:@"dismissViewControllerAnimated"] isKindOfClass:[NSString class]] ) ){
                dismissAtClick =   (BOOL)([[usePersonnalisedParams objectForKey:@"dismissViewControllerAnimated"] isEqualToString: @"YES"]);
            }else if([[usePersonnalisedParams objectForKey:@"dismissViewControllerAnimated"] isKindOfClass: [NSArray class] ]){
                dismissableBtnsPrefs = [usePersonnalisedParams objectForKey:@"dismissViewControllerAnimated"];
            }
        }
        
        /* ************** ************** ************** ************** ************** */
        
        /* ************** ************** ************** ************** ************** */
        
        // *********************
        int idxBtn = 0;
        if(actions != nil && [actions isKindOfClass:[NSArray class]])
        {
            for (id actionsIn in actions) {
                if([actionsIn isKindOfClass:[UIAlertAction class]])
                {
                    // configure if button should Dismiss Presented ViewController, the one call this Alert Class
                    bool btnDoDismiss = (bool) ( (nil != dismissableBtnsPrefs && ([dismissableBtnsPrefs count] >=1) && ( [dismissableBtnsPrefs count] >= idxBtn) && [ [dismissableBtnsPrefs objectAtIndex: idxBtn ] isKindOfClass:[NSString class]] ) ?
                                                ([ ((NSString*)[dismissableBtnsPrefs objectAtIndex:idxBtn]) isEqualToString:@"YES"]) : dismissAtClick );
                    
                    // :: NSLog(@" should dissmis :: %d ", btnDoDismiss);
                    // self is the presented ViewController
                    if(alertViewController_showed != self)
                    {
                        void (^actionsIncompletionEvent) (UIAlertAction * _Nonnull action) = (( nil !=   [actionsIn valueForKey:@"_handler"] )? [actionsIn valueForKey:@"_handler"]:  [actionsIn valueForKey:@"handler"]) ;
                        
                        // ::  id windowAlertCntl = alertViewController;
                        id windowAlertCntl_presented = windowviewcntl_presented;
                        
                        id addactionsIn  = [UIAlertAction actionWithTitle: (((UIAlertAction*)actionsIn).title) style:(((UIAlertAction*)actionsIn).style) handler: ^(UIAlertAction * _Nonnull action) {
                            
                            if(actionsIncompletionEvent != nil)
                                actionsIncompletionEvent(action);
                            
                            // :: NSLog(@" did should dissmis :: %d ", btnDoDismiss);
                            
                            if([windowAlertCntl_presented isKindOfClass:[UINavigationController class]] && btnDoDismiss){
                                [windowAlertCntl_presented dismissViewControllerAnimated:YES completion:^{
                                    ;;
                                }];
                            }
                        }];
                        
                        
                        [alertViewController_showed addAction: addactionsIn];
                    }else{
                        [alertViewController_showed addAction: actionsIn : ((btnDoDismiss)? @"YES": @"NO")];
                    }
                    
                    idxBtn  ++;
                }
            }
        }else if(actions != nil && [actions isKindOfClass:[UIAlertAction class]])
        {
            [alertViewController_showed addAction:actions];
        }else if(actions != nil )
        {
            // test kind of the params
            if( [ actions isKindOfClass: [NSString class] ] && ( nil != NSStringFromSelector(NSSelectorFromString(actions)) ) )
            {
                action_argType = [actions class];
                // ensure selector exists by double conversion type ...
                action_forwardArg_argSelector = NSStringFromSelector(NSSelectorFromString(actions));
                action_forwardArg_argClass = self;
                action_argType_valid  =  [ action_forwardArg_argSelector respondsToSelector: NSSelectorFromString( action_forwardArg_argSelector ) ];
            }else if( [ NSStringFromClass([actions class]) isEqualToString: (@"__NSMallocBlock__") ]  ){
                action_forwardArg_argBlockInvoke = actions;
                action_argType_valid  = YES ;
            } else if( [ NSStringFromClass([actions class]) isEqualToString: (@"__NSGlobalBlock__") ]  ){
                action_forwardArg_argBlockInvoke = actions;
                action_argType_valid  = YES ;
            } else {
                action_argType = [actions class];
            }
            
            
            if ( ! action_argType_valid ) {
                [NSException raise:NSInvalidArgumentException format:@" Erreur :: actions type (%@) is not acceptable argument ....", action_argType];
            }
            
        }
        
        /* ************** ************** ************** ************** ************** */
        
        /* ************** ************** ************** ************** ************** */
        
        if([[alertViewController_showed actions] count] <1)
        {
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                @try {
                    if(action_forwardArg_argSelector && action_forwardArg_argClass && [ action_forwardArg_argSelector respondsToSelector: NSSelectorFromString( action_forwardArg_argSelector ) ])
                    {
                        [action_forwardArg_argClass performSelectorOnMainThread: NSSelectorFromString( action_forwardArg_argSelector ) withObject:nil waitUntilDone:YES];
                    }
                    if(action_forwardArg_argBlockInvoke != nil)
                    {
                        [ action_forwardArg_argBlockInvoke invoke];
                    }
                    if(action_forwardArg_argSelector == nil && action_forwardArg_argBlockInvoke == nil)
                    {
                        if(windowviewcntl_presented && dismissAtClick){
                            [windowviewcntl_presented dismissViewControllerAnimated:YES completion:^{
                                ;;
                            }];
                        }
                        
                    }
                } @catch (NSException *exception) {
                    NSLog(@"%@ :: Error :: btn exception :: \n %@", NSStringFromSelector(_cmd), exception);
                    ;;
                } @finally {
                    ;;
                }
                
                
            }];
            [alertViewController_showed addAction:ok];
        }
        
        
        [ windowviewcntl_presented presentViewController:alertViewController_showed animated:YES completion:nil];
        
        if( completionEvent != nil )
        {
            void (^invokableBlock) (void) = ^(void){ completionEvent(alertViewController_showed); };
            //  [((id)invokableBlock) setArgument:(__bridge void * _Nonnull)(alertViewController) atIndex:0];
            [ invokableBlock invoke];
            
        }
        
        
        
    } @catch (NSException *exception) {
        NSLog(@"%@ :: Error :: exception :: \n %@", NSStringFromSelector(_cmd), exception);
        ;;
    } @finally {
        ;;
    }
}

#pragma mark Setup Actions on Buttons, recreate UIAlert Behaviours
- (void)addAction:(UIAlertAction *)action
{
    [self addAction: action :((dismissAtClick)? @"YES": @"NO")];
}

/* **************** ****************
 // shouldBtnDoDismiss -->> NSArray don't store BOOL type, so we use it's representation
 ****************  **************** */
-(void)addAction:(nullable UIAlertAction *)action :(  NSString* _Nullable )shouldBtnDoDismiss
{
    
    if(alertViewController ==nil) alertViewController = self; // [[GNSUIAlertWindowViewController alloc]init];
    if(actionsBtns == nil) actionsBtns = [NSMutableArray array];
    if(_actions == nil) _actions = [NSMutableArray array];
    if(_actionsDissmeable == nil) _actionsDissmeable = [NSMutableArray array];
    @try {
        
        
        UIButton *actionAddedBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        
        [actionAddedBtn setTitle: action.title forState:UIControlStateNormal];
        
        
        [[actionAddedBtn titleLabel] setFont:[UIFont systemFontOfSize:17]];
        
        [actionAddedBtn setUserInteractionEnabled:YES];
        
        [actionAddedBtn setTag: (2100 + ((int)[_actions count]) )];
        
        [actionAddedBtn addTarget:self action:@selector(invokeSender:) forControlEvents:UIControlEventTouchDown];
        
        
        
        [actionAddedBtn setBackgroundColor: ( ( [actionsBtnsColor count] >= 1
                                               && ( [_actions count] <= [actionsBtnsColor count] )
                                               && ( [ [actionsBtnsColor objectAtIndex: [_actions count] ] isKindOfClass: [UIColor class] ]) )?
                                             
                                             ([actionsBtnsColor objectAtIndex: [_actions count] ]) : [UIColor clearColor] ) ];
        
        // :: Red Color :: [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:1]
        
        [actionAddedBtn setFrame:CGRectMake(  0 ,  CGRectGetHeight([[self view] bounds] )  - 80, 200, ((ui_preferredStyle == UIAlertControllerStyleActionSheet)?60:40))];
        
        actionAddedBtn.layer.cornerRadius = (float)(CGRectGetHeight([ actionAddedBtn frame]) / 2.0);
        
        // :: actionAddedBtn.layer.borderColor = [[UIColor colorWithRed:0/255.0 green:153/255.0 blue:81/255.0 alpha:1] CGColor];
        actionAddedBtn.layer.borderColor = [[UIColor blackColor] CGColor];
        
        [actionAddedBtn.layer setBorderWidth: 1.0];
        actionAddedBtn.clipsToBounds = YES;
        
        UIColor* titledcolor = [[UIColor blackColor] readableForegroundColorForBackgroundColor: [actionAddedBtn backgroundColor] ];
        [actionAddedBtn setTitleColor: titledcolor  forState:UIControlStateNormal];
        
        
        
        
        [actionsBtns addObject: actionAddedBtn ];
        [[self view] addSubview: actionAddedBtn];
        
        [_actions addObject: action ];
        [_actionsDissmeable addObject: shouldBtnDoDismiss];
        
        // marge 10 minimum;;
        
        float btnWidth = ((float)(CGRectGetWidth([[self view] bounds]) / (float)[_actions count])) - ( ( ((int)[_actions count]) >1) ?
                                                                                                      ( ( ((int)[_actions count]) >2)  ? 10 : 20)
                                                                                                      : 40 ) ;
        
        float spaceBeetween = ( CGRectGetWidth([[self view] bounds]) - (btnWidth * ([_actions count]) ) ) / ((float)[_actions count]) ;
        float btnOrigin = 0;
        // :: NSLog(@" %@ :::: %f :: %@ :::: %@ ", NSStringFromSelector(_cmd), btnWidth, actionsBtns , _actions);
        
        
        for (id btnTrack in actionsBtns ) {
            if(btnWidth < 80)
                (((UIButton*)btnTrack).layer).cornerRadius = (float)(CGRectGetHeight([ ((UIButton*)btnTrack) frame]) / 2.50);
            
            int idx = (((int)[btnTrack tag]) - 2100);
            // :: ((int)[_actions count]) == 1 ----->> (spaceBeetween / 2)
            // :: 10 -- wwwww -- 10 ::
            // :: ------>> ( (btnWidth) *  idx) ------>>
            // :: ((int)[_actions count]) > 1 ----->> (spaceBeetween)
            // :: 10 -- wwwww -- 10 :: 10 -- wwwww -- 10 :: 10 -- wwwww -- 10 :: 10 -- wwwww -- 10 ::
            
            // :: ((int)[_actions count]) > 1 ----->> (spaceBeetween)
            // :: 20 -- wwwww -- 10 :: 10 -- wwwww -- 20 ::
            int margeRight =  (spaceBeetween /2) * ((idx==0)?1: idx+1);
            
            if(idx>0)
                margeRight = ([[actionsBtns objectAtIndex: (idx -1) ] frame]).origin.x + btnWidth + (spaceBeetween );
            
            if( ui_preferredStyle == UIAlertControllerStyleAlert)
            {
                margeRight = 20;
                btnWidth = CGRectGetWidth([[self view] bounds]) - (margeRight*2);
                
                btnOrigin = CGRectGetHeight([[self view] bounds]) -  (  ( CGRectGetHeight([actionAddedBtn frame]) + margeRight ) * [_actions count]) ;
                
                btnOrigin += (  ( CGRectGetHeight([actionAddedBtn frame]) + margeRight ) * idx);
                
            } else {
                
                btnOrigin =  ([actionAddedBtn frame]).origin.y;
            }
            
            [btnTrack setFrame: CGRectMake(  margeRight,
                                           btnOrigin,
                                           
                                           btnWidth,
                                           CGRectGetHeight([actionAddedBtn frame]) )];
            // :: NSLog(@" %d :: frame btn .... : %f :: %d :: frame view :: %f :: %@", idx, spaceBeetween, margeRight, CGRectGetWidth([[self view] bounds] ), NSStringFromCGRect([btnTrack frame] ));
        }
    } @catch (NSException *exception) {
        NSLog(@"%@ :: Error :: exception :: \n %@", NSStringFromSelector(_cmd), exception);
        ;;
    } @finally {
        ;;
    }
    
}
#pragma mark ---------
-(void) invokeSender:(id) sender
{
    if(alertViewController ==nil) alertViewController = self;
    if(actionsBtns == nil) actionsBtns = [NSMutableArray array];
    if(_actions == nil) _actions = [NSMutableArray array];
    if(_actionsDissmeable == nil) _actionsDissmeable = [NSMutableArray array];
    
    @try {
        int idxBtn = (((int)[sender tag]) - 2100);
        UIAlertAction* actionsBtnsAlert = ((UIAlertAction*)[_actions objectAtIndex: idxBtn ]) ;
        //      NSLog(@" %@ :::: %ld :: %@ :::: %@  :::: %@ ", NSStringFromSelector(_cmd), [sender tag], sender, [actionsBtnsAlert valueForKey:@"handler"], [actionsBtnsAlert valueForKey:@"_handler"]);
        void (^completionEvent) (UIAlertAction * _Nonnull action) = (( nil !=   [actionsBtnsAlert valueForKey:@"_handler"] )? [actionsBtnsAlert valueForKey:@"_handler"]:  [actionsBtnsAlert valueForKey:@"handler"]) ;
        
        id windowAlertCntl = alertViewController;
        id windowAlertCntl_presented = windowviewcntl_presented;
        
        BOOL dismissableViewActionBtn = dismissAtClick;
        
        dismissableViewActionBtn = ((idxBtn <= [_actionsDissmeable count] && ([_actionsDissmeable count] >=1) && [ [_actionsDissmeable objectAtIndex: idxBtn ] isKindOfClass:[NSString class]]) ? ((BOOL)[[_actionsDissmeable objectAtIndex: idxBtn ]  isEqualToString:@"YES"] ) : dismissableViewActionBtn) ;
        
        // :: NSLog(@" invoke :: should dissmis :: %d ", dismissableViewActionBtn);
        
        void (^invokableBlock) (void) = ^(void){
            [windowAlertCntl  dismissViewControllerAnimated:YES completion:^{
                ;;
            }];
            if(windowAlertCntl_presented && [windowAlertCntl_presented isKindOfClass:[UINavigationController class]] && dismissableViewActionBtn){
                [windowAlertCntl_presented dismissViewControllerAnimated:YES completion:^{
                    ;;
                }];
            }
        };
        
        if( completionEvent != nil )
        {
            
            invokableBlock = ^(void){
                // take the original action on the scene
                completionEvent(actionsBtnsAlert);
                //Then Dismiss the alert
                [windowAlertCntl  dismissViewControllerAnimated:YES completion:^{
                    ;;
                }];
                // dismiss alert controller
                if(windowAlertCntl_presented && [windowAlertCntl_presented isKindOfClass:[UINavigationController class]] && dismissableViewActionBtn){
                    [windowAlertCntl_presented dismissViewControllerAnimated:YES completion:^{
                        ;;
                    }];
                }
                
            };
            
        }
        // Invoke the action ....
        [ invokableBlock invoke];
        
    } @catch (NSException *exception) {
        NSLog(@"%@ :: Error :: exception :: \n %@", NSStringFromSelector(_cmd), exception);
        ;;
    } @finally {
        ;;
    }
    
    
    
}

#pragma mark ---------- Actions UI References
-(NSArray*)actions
{
    
    if(alertViewController ==nil) alertViewController = self;
    if(actionsBtns == nil) actionsBtns = [NSMutableArray array];
    if(_actions == nil) _actions = [NSMutableArray array];
    if(_actionsDissmeable == nil) _actionsDissmeable = [NSMutableArray array];
    return _actions;
}

-(NSArray*)buttons
{
    
    if(alertViewController ==nil) alertViewController = self;
    if(actionsBtns == nil) actionsBtns = [NSMutableArray array];
    if(_actions == nil) _actions = [NSMutableArray array];
    if(_actionsDissmeable == nil) _actionsDissmeable = [NSMutableArray array];
    return (NSArray*)actionsBtns;
}
-(_Nonnull id)delegate
{
    return self;
}
#pragma mark ---------- UI Labels & Messages References
-(void)setAlertView_message:(NSAttributedString*)message
{
    @try {
        [alertView_message setAttributedText: message];
    } @catch (NSException *exception) {
        NSLog(@"%@ :: Error :: exception :: \n %@", NSStringFromSelector(_cmd), exception);
        ;;
    } @finally {
        ;;
    }
    // :: (BOOL)[  alertView_message.text isEqualToString: message.string ];
}
-(void)setAlertView_title:(NSAttributedString*)message
{
    @try {
        
        [alertView_title setAttributedText: message];
    } @catch (NSException *exception) {
        NSLog(@"%@ :: Error :: exception :: \n %@", NSStringFromSelector(_cmd), exception);
        ;;
    } @finally {
        ;;
    }
    // :: (BOOL)[  alertView_title.text isEqualToString: message.string ];
}
#pragma mark ---------- UI Elements Labels & Messages References

-(id)label
{
    return alertView_title;
}
-(id)message
{
    return alertView_message;
}
-(id)alertView_icon
{
    return alertView_icon;
}
@end


@implementation UIColor (ColorTextForeGroundColor)

- (UIColor  * _Nonnull )readableForegroundColorForBackgroundColor:(UIColor*)backgroundColor {
    size_t count = CGColorGetNumberOfComponents(backgroundColor.CGColor);
    const CGFloat *componentColors = CGColorGetComponents(backgroundColor.CGColor);
    
    CGFloat darknessScore = 0;
    if (count == 2) {
        darknessScore = (((componentColors[0]*255) * 299) + ((componentColors[0]*255) * 587) + ((componentColors[0]*255) * 114)) / 1000;
    } else if (count == 4) {
        darknessScore = (((componentColors[0]*255) * 299) + ((componentColors[1]*255) * 587) + ((componentColors[2]*255) * 114)) / 1000;
    }
    
    if (darknessScore < 125) {
        return [UIColor blackColor];
    }
    
    return [UIColor whiteColor];
}

@end


/* ************** ************** ************** **************
 // exemple
  ************** ************** ************** **************
 
[UIApplicationSharedDelegate showMessage:@"Aucun ajout" title:nil withActions: [NSArray arrayWithObjects:
                                                                                [UIAlertAction actionWithTitle:@"OK" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    NSLog(@" :::: action ::: %@ ::: ",[self class]);
    NSLog(@" :::: action ::ui:: %@ ::: ",action);
    ;;
}],
                                                                                // :: [UIAlertAction actionWithTitle:@"View" style: UIAlertActionStyleDefault handler:nil],
 
                                                                                   [UIAlertAction actionWithTitle:@"Retour" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                                                 NSLog(@" :::: action 2 ::: %@ ::: ",[self class]);
                                                                                 NSLog(@" :::: action 2 ::ui:: %@ ::: ",action);
                                                                                 ;;
                                                                                 }],
                                                                                 
                                                                                // :: [UIAlertAction actionWithTitle:@"4" style: UIAlertActionStyleDefault handler:nil]
                                                                                  ,nil]
 
                              completion:^(id actionHandler) {
                                  // called when the alert is on screen
                                  NSLog(@" ::::: %@  :::: %@ ", self, [[UIApplication sharedApplication] windows]);
                               
                                  
                              } : [NSDictionary dictionaryWithObjectsAndKeys:@"YES", @"usePersonnalisedParams",
                                   [NSArray arrayWithObjects:@"YES", @"NO",@"YES",@"NO", nil], @"dismissViewControllerAnimated",
                                   [NSArray arrayWithObjects:
                                    [UIColor colorWithRed:0/255.0 green:170/255.0 blue:255/255.0 alpha:1], @"--",@"--",@"--", nil], @"UIControlColor",
                                   nil] ];

  ************** ************** ************** **************
  ************** ************** ************** ************** */
