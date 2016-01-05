//
//  BaseViewController.m
//  VerneNavigationBar
//
//  Created by vernepung on 15/9/6.
//  Copyright (c) 2015年 vernepung. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationController.h"
#import "AppDelegate.h"

typedef NS_ENUM(NSUInteger, kViewControllerState) {
    kViewControllerStateNone = 0,
    kViewControllerStateWillBack = 1,
    kViewControllerStateDidBack = 2,
    kViewControllerStateCancelBack = 3,
};

@interface BaseViewController ()
{
    NSUInteger _currentViewControllers;
}
@property (assign,nonatomic) kViewControllerState state;
/**
 *  页面将要后退
 */
- (void)viewWillBack;

/**
 *  页面已后退
 */
- (void)viewDidBack;
@end

@implementation BaseViewController

- (void)setState:(kViewControllerState)state
{
    NSString *log = @"";
    if (_state == state)return;
    _state = state;
    switch (_state) {
        case kViewControllerStateNone:
            log = @"进入";
            break;
        case kViewControllerStateWillBack:
            log = @"准备后退";
            break;
        case kViewControllerStateDidBack:
            log = @"后退成功";
            break;
        case kViewControllerStateCancelBack:
            log = @"取消后退";
            break;
    }
    [AppDelegate shareAppdelegate].tipsLabel.text = log;
}

- (NSUInteger)viewControllersCount
{
    return self.navigationController.viewControllers.count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);
    _currentViewControllers = self.navigationController.viewControllers.count;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_state == kViewControllerStateWillBack)
    {
        self.state = kViewControllerStateCancelBack;
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if (_currentViewControllers > [self viewControllersCount])
    {
        [self viewDidBack];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (_currentViewControllers > [self viewControllersCount])
    {
        [self viewWillBack];
    }
}

- (void)viewWillBack{
    self.state = kViewControllerStateWillBack;
}

- (void)viewDidBack{
    self.state = kViewControllerStateDidBack;
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewBackFromViewController:withResult:)])
    {
        __weak BaseViewController *weakSelf = self;
        [self.delegate viewBackFromViewController:weakSelf withResult:nil];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
