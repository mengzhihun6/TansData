//
//  JGDelegateVC.m
//  TansData-Demo
//
//  Created by 郭军 on 16/8/20.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import "JGDelegateVC.h"

@interface JGDelegateVC ()

@end

@implementation JGDelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)modifiData {
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(tansDataWithString:)]) {
        [self.delegate tansDataWithString:self.textField.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
  
}



@end
