//
//  Test1ViewController.m
//  VerneNavigationBar
//
//  Created by vernepung on 15/9/6.
//  Copyright (c) 2015年 vernepung. All rights reserved.
//

#import "Test1ViewController.h"
#import "BaseNavigationController.h"

@interface Test1ViewController ()

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationItem.backBarButtonItem setTitle:@"返回么？"];
    self.nextViewBackTitle = @"首页";
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

@end
