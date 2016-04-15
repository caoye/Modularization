//
//  UIViewController+ParametersPassing.h
//  TvBuy
//
//  Created by ichsy on 15/6/16.
//  Copyright (c) 2015年 Beijing CHSY E-Business Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HandelBlock)(id block);

@interface UIViewController (ParametersPassing)

@property (nonatomic, strong, readwrite) id viewDict;
@property (nonatomic,copy,readwrite)HandelBlock handleBlock;

@end
