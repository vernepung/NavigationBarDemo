//
//  TestViewController.m
//  VerneNavigationBar
//
//  Created by vernepung on 15/9/6.
//  Copyright (c) 2015年 vernepung. All rights reserved.
//

#import "TestViewController.h"
#import "Test2ViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.backTitle = @"真首页";
    self.title = @"TestViewController";
    UIButton *uBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    [uBtn setTitle:@"11111" forState:0];
    [uBtn addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
    [uBtn setTitleColor:[UIColor blackColor] forState:0];
    [self.view addSubview:uBtn];
    NSLog(@"TestViewController：%zd",self.navigationController.navigationBar.items.count);
    // Do any additional setup after loading the view.
}

- (void)send:(id)sender
{
    Test2ViewController *test2 = [Test2ViewController new];
    
    [self.navigationController pushViewController:test2 animated:YES];
//    [self.navigationController popViewControllerAnimated:NO];
    NSLog(@"before remove:%zd",self.navigationController.navigationBar.items.count);
    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray: self.navigationController.viewControllers];
    [arr removeObjectAtIndex:arr.count - 2];
    self.navigationController.viewControllers = arr;
    NSLog(@"removed:%zd",self.navigationController.navigationBar.items.count);
}

//- (void)viewDidDisappear:(BOOL)animated
//{
////    [super viewDidDisappear:animated];
////    return;
////    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray: self.navigationController.viewControllers];
////    UIViewController *vc = arr[arr.count - 2];
////
////    NSMutableArray *items = [[NSMutableArray alloc] initWithArray: self.navigationController.navigationBar.items];
////    [self.navigationController.navigationBar popNavigationItemAnimated:YES];
//////    [arr removeObjectAtIndex:1];
//////    [items removeObjectAtIndex:1];
////    self.navigationController.viewControllers = arr;
////    self.navigationController.navigationBar.items = items;
//}

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
