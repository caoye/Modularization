//
//  UIViewController+ParametersPassing.m
//  TvBuy
//
//  Created by ichsy on 15/6/16.
//  Copyright (c) 2015年 Beijing CHSY E-Business Co., Ltd. All rights reserved.
//

#import "UIViewController+ParametersPassing.h"
#import <objc/runtime.h>

static void * MyObjectDictKey = (void *)@"MyObjectDictKey";
static void * MyObjectBlockKey = (void *)@"MyObjectBlockKey";

@implementation UIViewController (ParametersPassing)

@dynamic viewDict;
@dynamic handleBlock;

//添加回调方法属性
-(void)setHandleBlock:(HandelBlock)handleBlock
{
    objc_setAssociatedObject(self, MyObjectBlockKey, handleBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HandelBlock)handleBlock{
    return objc_getAssociatedObject(self, MyObjectBlockKey);
}

//添加传递参数属性
- (id)viewDict
{
    return objc_getAssociatedObject(self, MyObjectDictKey);
}

- (void)setViewDict:(id)viewDict
{
    objc_setAssociatedObject(self, MyObjectDictKey, viewDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
