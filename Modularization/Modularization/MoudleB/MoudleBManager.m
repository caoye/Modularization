//
//  MoudleBManger.m
//  Modularization
//
//  Created by ichsy on 16/4/1.
//  Copyright © 2016年 ichsy. All rights reserved.
//

#import "MoudleBManager.h"
#import "CustomView.h"

@implementation MoudleBManager

/*
 1. manager中的方法都要有返回值，如果没有返回值的也要写成（return nil）,因为runtime调用方法的时候只写了一种有返回值调用，如果需要可以自行添加无返回值的方法调用；
 
 2. 方法调用，如果有block回调的方法一定要将方法写成带有一个参数和一个block参数的形式（localAdgueWithValue:(NSString*)value andBlock:(void (^)(NSString * str))block）不然会造成参数找不到，崩溃
 
 3.模块A调用某块B的（不用引用模块b类头文件，这样两个模块就可以完全独立，调用是模块a中的类通过eventbuts找到模块b的manager，然后找到对应的方法，每个模块都有一个manager管理类，里面是该模块对外的接口方法。跳转类可以改成URL跳转（类似淘宝的那种），通过超链接跳转到对应的类，但是参数传递和方法回调需要其他方式去处理）
 */

//w无回调方法的调用
- (id)creatLabel:(NSDictionary *)dict {
    
    CGRect frame = [dict[@"frame"] CGRectValue];
    UIViewController * vc = dict[@"vc"];
    NSString * text = dict[@"title"];

    CustomView * customView = [[CustomView alloc] init];
    [customView uiConfig:frame andVc:vc andText:text];
    
    return nil;
}

//带有回调方法的调用
- (id)creatLabel:(NSDictionary *)dict andBlock:(void(^)(NSString* message))messageBlock {
    
    CGRect frame = [dict[@"frame"] CGRectValue];
    UIViewController * vc = dict[@"vc"];
    NSString * text = dict[@"title"];
    
    CustomView * customView = [[CustomView alloc] init];
    [customView uiConfigBlock:frame andVc:vc andText:text andBlock:^(NSString *message) {
        messageBlock(message);
    }];
    
    return nil;
}

@end
