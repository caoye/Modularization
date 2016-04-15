//
//  CustomView.h
//  Modularization
//
//  Created by ichsy on 16/4/1.
//  Copyright © 2016年 ichsy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

- (void)uiConfig:(CGRect)frame andVc:(UIViewController *)vc andText:(NSString *)text;

- (void)uiConfigBlock:(CGRect)frame andVc:(UIViewController *)vc andText:(NSString *)text andBlock:(void(^)(NSString* message))messageBlock;


@end
