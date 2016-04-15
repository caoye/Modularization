//
//  CustomView.m
//  Modularization
//
//  Created by ichsy on 16/4/1.
//  Copyright © 2016年 ichsy. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)uiConfig:(CGRect)frame andVc:(UIViewController *)vc andText:(NSString *)text {
    
    UILabel * label = ({
        
        UILabel * textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 200, 100)];
        textLabel.backgroundColor = [UIColor redColor];
        textLabel.text = text;
        
        textLabel;
    });
    [vc.view addSubview:label];
}

- (void)uiConfigBlock:(CGRect)frame andVc:(UIViewController *)vc andText:(NSString *)text andBlock:(void(^)(NSString* message))messageBlock{
    
    UILabel * label = ({
        
        UILabel * textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 200, 100)];
        textLabel.backgroundColor = [UIColor redColor];
        textLabel.text = text;
        
        textLabel;
    });
    [vc.view addSubview:label];
    messageBlock(@"－－回调－－");
    
}


@end
