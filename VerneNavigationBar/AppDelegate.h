//
//  AppDelegate.h
//  VerneNavigationBar
//
//  Created by vernepung on 15/9/6.
//  Copyright (c) 2015年 vernepung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

+ (AppDelegate *)shareAppdelegate;
@property (strong, nonatomic) UILabel *tipsLabel;
@property (strong, nonatomic) UIWindow *window;


@end

