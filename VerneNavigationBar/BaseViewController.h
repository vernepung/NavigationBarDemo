//
//  BaseViewController.h
//  VerneNavigationBar
//
//  Created by vernepung on 15/9/6.
//  Copyright (c) 2015年 vernepung. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BaseViewControllerDelegate;
@interface BaseViewController : UIViewController
/**
 *  下一个页面的back title
 */
@property (copy,nonatomic) NSString* nextViewBackTitle;

@property (weak,nonatomic) id<BaseViewControllerDelegate> delegate;

@end


@protocol BaseViewControllerDelegate <NSObject>

- (void)viewBackFromViewController:(BaseViewController *)viewController withResult:(id)result;

@end
