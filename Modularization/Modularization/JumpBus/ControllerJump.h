//
//  ControllerJump.h
//  TvBuy
//
//  Created by ichsy on 15/6/16.
//  Copyright (c) 2015年 Beijing CHSY E-Business Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ControllerJump : NSObject

+ (ControllerJump *)sharedManager;

+ (UIViewController*)allocVc:(NSString*)viewControllerName andParamDict:(id)ParamDict andHandleBlock:(void (^)(id param))theBlock;

+ (id)allocAnyObjectWithStringName:(NSString*)objectName;

@property (nonatomic,strong)NSMutableDictionary * vcDict;

@end
