//
//  Test2ViewController.m
//  VerneNavigationBar
//
//  Created by vernepung on 15/9/6.
//  Copyright (c) 2015年 vernepung. All rights reserved.
//

#import "Test2ViewController.h"

@interface Test2ViewController ()

@end

@implementation Test2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"你好" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"star_all.png"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.title = @"星星";
    self.navigationItem.leftBarButtonItem.enabled = NO;
    self.title = @"星星";
    NSLog(@"Test2ViewController：%zd",self.navigationController.navigationBar.items.count);
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

@end
