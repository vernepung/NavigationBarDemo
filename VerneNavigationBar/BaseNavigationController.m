//
//  BaseNavigationViewController.m
//  VerneNavigationBar
//
//  Created by vernepung on 15/9/6.
//  Copyright (c) 2015年 vernepung. All rights reserved.
//

#import "BaseNavigationController.h"
#import "BaseViewController.h"

@interface BaseNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
{
    BOOL _isEnablePop;
}
@end

@implementation BaseNavigationController

+ (void)initialize
{
    [[UINavigationBar appearanceWhenContainedIn:[BaseNavigationController class], nil] setBackgroundImage:[BaseNavigationController imageWithColor:[UIColor purpleColor]] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearanceWhenContainedIn:[BaseNavigationController class], nil] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearanceWhenContainedIn:[BaseNavigationController class], nil] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak BaseNavigationController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
    // Do any additional setup after loading the view.
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSString *backTitle = @" ";
    if ([viewController isKindOfClass:[BaseViewController class]])
    {
        backTitle = ((BaseViewController *)viewController).nextViewBackTitle;
        if (!backTitle || backTitle.length <= 0)
            backTitle = @" ";
    }
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:nil action:nil];

    viewController.navigationItem.backBarButtonItem = backItem;
}

#pragma mark UIGestureRecognizerDelegate
//控制根Controller不能右滑动
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if(self.viewControllers.count <= 1){
        return NO;
    }
    return _isEnablePop;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    _isEnablePop = YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    _isEnablePop = NO;
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (UIImage*)imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
