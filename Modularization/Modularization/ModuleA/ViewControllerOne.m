//
//  ViewControllerOne.m
//  Modularization
//
//  Created by ichsy on 16/4/1.
//  Copyright © 2016年 ichsy. All rights reserved.
//

#import "ViewControllerOne.h"

@interface ViewControllerOne ()

@end

@implementation ViewControllerOne


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //传过来的参数
    NSDictionary * dict = self.viewDict;
    NSLog(@"----%@",dict);

}

- (IBAction)btnClikc:(id)sender {
    //方法回调
    NSDictionary * dict = @{@"index":@(100)};
    //参数不能为id类型，没有参数也要传@""
    self.handleBlock(dict);
}

- (IBAction)jumpClick:(id)sender {
    
    UIViewController * vc = [ControllerJump allocVc:@"ViewControllerTwo" andParamDict:nil andHandleBlock:^(id param) {
    }];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
