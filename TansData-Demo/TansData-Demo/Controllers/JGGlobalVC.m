//
//  JGGlobalVC.m
//  TansData-Demo
//
//  Created by 郭军 on 16/8/20.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import "JGGlobalVC.h"

NSString *myText;

@interface JGGlobalVC ()

@end

@implementation JGGlobalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)modifiData {
    
    //修改全局变量的值
    myText = self.textField.text;
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
