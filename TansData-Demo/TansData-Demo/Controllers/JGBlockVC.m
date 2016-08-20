//
//  JGBlockVC.m
//  TansData-Demo
//
//  Created by 郭军 on 16/8/20.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import "JGBlockVC.h"

@interface JGBlockVC ()

@end

@implementation JGBlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)modifiData {
    
    self.block(self.textField.text);
    [self.navigationController popViewControllerAnimated:YES];
    
}




@end
