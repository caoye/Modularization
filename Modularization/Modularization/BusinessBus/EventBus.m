//
//  EventBus.m
//  TvBuy
//
//  Created by ichsy on 15/7/16.
//  Copyright (c) 2015年 Beijing CHSY E-Business Co., Ltd. All rights reserved.
//

#import "EventBus.h"
#import <objc/runtime.h>

@implementation EventBus

-(instancetype)init{
    self=[super init];
    if (self) {
        
    }
    return self;
}

- (NSDictionary *)managersDict
{
    if (!_managersDict) {
        _managersDict = [[NSMutableDictionary alloc]init];

        NSDictionary * dictObject = [[NSDictionary alloc]initWithObjectsAndKeys:@"MoudleAManager",MoudleA_Manager,@"MoudleBManager",MoudleB_Manager, nil];
        for (int i=0; i<dictObject.count; i++) {
            id manager;
            manager = [self allocManager:[dictObject.allValues objectAtIndex:i]];
            
            NSAssert1(manager, @"创建了不存在的类%@", [dictObject.allValues objectAtIndex:i]);
            
            [_managersDict setObject:manager forKey:[dictObject.allKeys objectAtIndex:i]];
        }
    }
    return _managersDict;
}

- (id)allocManager:(NSString*)managerString{
   Class class = NSClassFromString(managerString);
    id manager = [[class alloc]init];
    return manager;
}

+ (EventBus *)shareEvenBus{

    static EventBus * shareEventInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareEventInstance = [[self alloc] init];
    });
    return shareEventInstance;
    
}

+ (id)postModuleName:(NSString*)Module andMethod:(NSString *)methodStr andParam:(id)params andBlock:(void (^)(id blockParam))block{
    
    id manager = [[EventBus shareEvenBus].managersDict objectForKey:Module];
    SEL customSelector = NSSelectorFromString(methodStr);
    if (!params) {
        params = @"";
    }
    
    NSAssert1(customSelector, @"不存在方法%@", methodStr);
    
    id result;
    if ([manager respondsToSelector:customSelector]){
        IMP imp = [manager methodForSelector:customSelector];
        id (*func)(id, SEL ,id ,id ) = (void *)imp;
        result = func(manager, customSelector,params,block);
    }
    
    return result;
}

@end
