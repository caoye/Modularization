//
//  EventBus.h
//  TvBuy
//
//  Created by ichsy on 15/7/16.
//  Copyright (c) 2015年 Beijing CHSY E-Business Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventBus : NSObject

#define MoudleA_Manager @"MoudleAManager"
#define MoudleB_Manager @"MoudleBManager"

@property(nonatomic,strong)NSMutableDictionary * managersDict;

+ (EventBus *)shareEvenBus;

+ (id)postModuleName:(NSString*)Module andMethod:(NSString *)methodStr andParam:(id)params andBlock:(void (^)(id blockParam))block;

@end
