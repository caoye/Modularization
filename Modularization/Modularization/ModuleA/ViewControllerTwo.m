//
//  ViewControllerTwo.m
//  Modularization
//
//  Created by ichsy on 16/4/1.
//  Copyright © 2016年 ichsy. All rights reserved.
//

#import "ViewControllerTwo.h"

@interface ViewControllerTwo ()

@end

@implementation ViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

#pragma mark -- 按钮时间
- (IBAction)click:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"内容" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [self doSomething];
    }];
    
    [alertController addAction:sureAction];
    [self presentViewController:alertController animated:YES completion:nil];

}

- (void)doSomething {

    CGRect rect = CGRectMake(100, 100, CGRectGetWidth(self.view.frame), 100);
    NSValue *value=[NSValue valueWithCGRect:rect];

    NSDictionary * dict = @{@"frame":value, @"vc":self ,@"title":@"测试数据"};

    [EventBus postModuleName:MoudleB_Manager andMethod:@"creatLabel:" andParam:dict andBlock:^(id blockParam) {
        
    }];
    
    //代block回调方法调用
    
//    [EventBus postModuleName:MoudleB_Manager andMethod:@"creatLabel:andBlock:" andParam:dict andBlock:^(id blockParam) {
//        NSLog(@"---%@",blockParam);
//    }];
    
}

@end
