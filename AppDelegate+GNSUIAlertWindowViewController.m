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

@end

@interface GNSUIAlertWindowViewController ()

@end

@implementation GNSUIAlertWindowViewController
@synthesize  dismissAtClick;
@synthesize  windowviewcntl_presented;
@synthesize  alertView_;
@synthesize  alertView_label;
@synthesize  actionsBtns;
@synthesize  _actions;

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
    
    [actionsBtns removeAllObjects];
    [_actions removeAllObjects];
    
    @try {
        dismissAtClick = YES;
        title = ((title == nil)?@"Information":title);
        message = ((message == nil)?@"...":message);
        
        u_long alertStyle = style ; // :: UIAlertControllerStyleActionSheet; // :: UIAlertActionStyleDefault
        
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
            // :: alertStyle = UIAlertControllerStyleAlert;
            
        }
        
        
        /* ************** ************** ************** ************** ************** */
        
        /* ************** ************** ************** ************** ************** */
        
        
        // UIAlertController * alertViewController = nil;
        if( ((BOOL)usePersonnalisedParams) != NO && ![usePersonnalisedParams isKindOfClass: [NSDictionary class] ] ){
            [NSException raise:NSInvalidArgumentException format:@" Erreur :: actions type (%@) is not acceptable argument ....", action_argType];
        }else if (((BOOL)usePersonnalisedParams) != NO && [usePersonnalisedParams isKindOfClass: [NSDictionary class] ] && (BOOL)[usePersonnalisedParams objectForKey:@"usePersonnalisedParams"] ){
            
            
            alertViewController = self;// ::[[UIViewController alloc] init];
            alertViewController_showed = self;
            alertView_ = [ [((UIViewController*)rootView) view] viewWithTag: 2100 ]; // ::
            if(alertView_ == nil ){
                alertView_ = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds] ];
                [[((UIViewController*)rootView) view] addSubview:alertView_];
            }
            
            [alertView_ setTag:2100];
            
            [alertView_ setFrame:[[UIScreen mainScreen] bounds] ];
            
            [alertView_ setBackgroundColor:[UIColor colorWithHue:0.6 saturation:0.8 brightness:0.8 alpha:0.8]];
            /*
             UIButton *abortBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
             abortBtn.layer.cornerRadius = CGRectGetHeight([abortBtn bounds]) / 2.0 ;
             [abortBtn setBackgroundColor:[UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:1]];
             [abortBtn setTitle:@"OK" forState:UIControlStateNormal];
             
             [abortBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
             
             [[abortBtn titleLabel] setFont:[UIFont systemFontOfSize:21]];
             
             [abortBtn setFrame:CGRectMake(  (CGRectGetWidth([[UIScreen mainScreen] bounds] )/2) - 100 ,  CGRectGetHeight([[UIScreen mainScreen] bounds] )  - 80, 200, 60)];
             [abortBtn setUserInteractionEnabled:YES];
             [abortBtn addTarget:alertViewController action:@selector(invokeBtn) forControlEvents:UIControlEventTouchDown];
             
             [alertView_ addSubview: abortBtn];
             */
            int widthlable =  (  CGRectGetWidth([[UIScreen mainScreen] bounds] ) - 40 );
            alertView_label = [[UILabel alloc] initWithFrame:CGRectMake(  ( CGRectGetWidth([[UIScreen mainScreen] bounds] ) / 2) - ( widthlable / 2 ) , 60, widthlable , 120)];
            alertView_label.backgroundColor = [UIColor clearColor];
            alertView_label.textColor = [UIColor whiteColor];
            alertView_label.font = [UIFont boldSystemFontOfSize: 17];
            alertView_label.text = message;
            alertView_label.numberOfLines = 4;
            alertView_label.textAlignment = NSTextAlignmentCenter;
            
            
            [alertView_ addSubview: alertView_label];
            [alertViewController setView: alertView_];
            
            
        }else{
            alertViewController_showed =  (id)   [UIAlertController
                                                  alertControllerWithTitle: title
                                                  message:message
                                                  preferredStyle:alertStyle];
            
            
        }
        
        if (((BOOL)usePersonnalisedParams) != NO && [usePersonnalisedParams isKindOfClass: [NSDictionary class] ] && (nil != [usePersonnalisedParams objectForKey:@"dismissViewController"] ) ){
            dismissAtClick =   (BOOL)[usePersonnalisedParams objectForKey:@"dismissViewController"] ;
        }
        
        /* ************** ************** ************** ************** ************** */
        
        /* ************** ************** ************** ************** ************** */
        
        // *********************
        if(actions != nil && [actions isKindOfClass:[NSArray class]])
        {
            for (id actionsIn in actions) {
                if([actionsIn isKindOfClass:[UIAlertAction class]])
                {
                    
                    if(alertViewController_showed != self)
                    {
                        void (^actionsIncompletionEvent) (UIAlertAction * _Nonnull action) = (( nil !=   [actionsIn valueForKey:@"_handler"] )? [actionsIn valueForKey:@"_handler"]:  [actionsIn valueForKey:@"handler"]) ;
                        
                        // ::  id windowAlertCntl = alertViewController;
                        id windowAlertCntl_presented = windowviewcntl_presented;
                        
                        id addactionsIn  = [UIAlertAction actionWithTitle: (((UIAlertAction*)actionsIn).title) style:(((UIAlertAction*)actionsIn).style) handler: ^(UIAlertAction * _Nonnull action) {
                            
                            if(actionsIncompletionEvent != nil)
                                actionsIncompletionEvent(action);
                            if([windowAlertCntl_presented isKindOfClass:[UINavigationController class]] && dismissAtClick){
                                [windowAlertCntl_presented dismissViewControllerAnimated:YES completion:^{
                                    ;;
                                }];
                            }
                        }];
                        
                        
                        [alertViewController_showed addAction: addactionsIn];
                    }else{
                        [alertViewController_showed addAction: actionsIn];
                    }
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


- (void)addAction:(UIAlertAction *)action{
    
    if(alertViewController ==nil) alertViewController = self; // [[GNSUIAlertWindowViewController alloc]init];
    if(actionsBtns == nil) actionsBtns = [NSMutableArray array];
    if(_actions == nil) _actions = [NSMutableArray array];
    UIButton *actionAddedBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    actionAddedBtn.layer.cornerRadius = CGRectGetHeight([actionAddedBtn bounds]) / 2.0 ;
    [actionAddedBtn setBackgroundColor:[UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:1]];
    [actionAddedBtn setTitle: action.title forState:UIControlStateNormal];
    
    [actionAddedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [[actionAddedBtn titleLabel] setFont:[UIFont systemFontOfSize:21]];
    
    [actionAddedBtn setFrame:CGRectMake(  0 ,  CGRectGetHeight([[self view] bounds] )  - 80, 200, 60)];
    
    [actionAddedBtn setUserInteractionEnabled:YES];
    
    [actionAddedBtn setTag: (2100 + ((int)[_actions count]) )];
    
    [actionAddedBtn addTarget:self action:@selector(invokeSender:) forControlEvents:UIControlEventTouchDown];
    
    [actionsBtns addObject: actionAddedBtn ];
    [[self view] addSubview: actionAddedBtn];
    
    [_actions addObject: action ];
    
    // marge 10 minimum;;
    
    float btnWidth = ((float)(CGRectGetWidth([[self view] bounds]) / (float)[_actions count])) - ( ( ((int)[_actions count]) >1) ?
                                                                                                  ( ( ((int)[_actions count]) >2)  ? 10 : 20)
                                                                                                  : 40 ) ;
    
    float spaceBeetween = ( CGRectGetWidth([[self view] bounds]) - (btnWidth * ([_actions count]) ) ) / ((float)[_actions count]) ;
    
    // :: NSLog(@" %@ :::: %d :: %@ :::: %@ ", NSStringFromSelector(_cmd), btnWidth, actionsBtns , _actions);
    
    for (id btnTrack in actionsBtns ) {
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
        
        [btnTrack setFrame: CGRectMake(   margeRight   ,
                                       ([actionAddedBtn frame]).origin.y,
                                       btnWidth,
                                       CGRectGetHeight([actionAddedBtn frame]) )];
        // ::
        NSLog(@" %d :: frame btn .... : %f :: %d :: frame view :: %f :: %@", idx, spaceBeetween, margeRight, CGRectGetWidth([[self view] bounds] ), NSStringFromCGRect([btnTrack frame] ));
    }
    
    
}
#pragma mark ---------
-(void) invokeSender:(id) sender
{
    if(alertViewController ==nil) alertViewController = self;
    if(actionsBtns == nil) actionsBtns = [NSMutableArray array];
    if(_actions == nil) _actions = [NSMutableArray array];
    @try {
        UIAlertAction* actionsBtnsAlert = ((UIAlertAction*)[_actions objectAtIndex: (((int)[sender tag]) - 2100) ]) ;
        //      NSLog(@" %@ :::: %ld :: %@ :::: %@  :::: %@ ", NSStringFromSelector(_cmd), [sender tag], sender, [actionsBtnsAlert valueForKey:@"handler"], [actionsBtnsAlert valueForKey:@"_handler"]);
        void (^completionEvent) (UIAlertAction * _Nonnull action) = (( nil !=   [actionsBtnsAlert valueForKey:@"_handler"] )? [actionsBtnsAlert valueForKey:@"_handler"]:  [actionsBtnsAlert valueForKey:@"handler"]) ;
        
        id windowAlertCntl = alertViewController;
        id windowAlertCntl_presented = windowviewcntl_presented;
        
        void (^invokableBlock) (void) = ^(void){
            [windowAlertCntl  dismissViewControllerAnimated:YES completion:^{
                ;;
            }];
            if([windowAlertCntl_presented isKindOfClass:[UINavigationController class]] && dismissAtClick){
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
                if([windowAlertCntl_presented isKindOfClass:[UINavigationController class]] && dismissAtClick){
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
    return _actions;
}

-(NSArray*)buttons
{
    
    if(alertViewController ==nil) alertViewController = self;
    if(actionsBtns == nil) actionsBtns = [NSMutableArray array];
    if(_actions == nil) _actions = [NSMutableArray array];
    return (NSArray*)actionsBtns;
}

@end

