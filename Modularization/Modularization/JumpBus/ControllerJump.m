//
//  ControllerJump.m
//  TvBuy
//
//  Created by ichsy on 15/6/16.
//  Copyright (c) 2015年 Beijing CHSY E-Business Co., Ltd. All rights reserved.
//

#import "ControllerJump.h"
#import "EventBus.h"
#import "UIViewController+ParametersPassing.h"

@implementation ControllerJump

-(instancetype)init{
    self=[super init];
    if (self) {
        _vcDict = [[NSMutableDictionary alloc]init];
    }
    return self;
}

+ (ControllerJump *)sharedManager
{
    static ControllerJump *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}

// 页面跳转
+ (UIViewController*)allocVc:(NSString*)viewControllerName andParamDict:(id)ParamDict andHandleBlock:(void (^)(id param))theBlock
{
    Class class = nil;
    class = NSClassFromString(viewControllerName);
    
    NSAssert(class, @"不能是不存在的vc");
    
    UIViewController *viewcontroller = [[class alloc] init];
    viewcontroller.viewDict = ParamDict;
    viewcontroller.handleBlock = theBlock;
    return viewcontroller;
}

// 创建任意的对象
+ (id)allocAnyObjectWithStringName:(NSString*)objectName{
    Class class = NSClassFromString(objectName);
    id theObjct = [[class alloc]init];
    return theObjct;
}

@end
