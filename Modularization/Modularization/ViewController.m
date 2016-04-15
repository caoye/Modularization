//
//  ViewController.m
//  Modularization
//
//  Created by ichsy on 16/4/1.
//  Copyright © 2016年 ichsy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)click:(id)sender {
    
    NSDictionary * dict = @{@"one":@"哈哈",@"two":@"饿饿"};
    //界面跳转
    UIViewController * vc = [ControllerJump allocVc:@"ViewControllerOne" andParamDict:dict andHandleBlock:^(id param) {
        //方法回调
        NSLog(@"回调打印－－－%@",param);
        self.view.backgroundColor = [UIColor yellowColor];
    }];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
