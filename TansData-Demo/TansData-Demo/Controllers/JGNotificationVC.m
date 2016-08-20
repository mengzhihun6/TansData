//
//  JGNotificationVC.m
//  TansData-Demo
//
//  Created by 郭军 on 16/8/20.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import "JGNotificationVC.h"

@interface JGNotificationVC ()

@end

@implementation JGNotificationVC

- (void)viewDidLoad {
    [super viewDidLoad];

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)modifiData {
    
    //保存需要传递的数据
    NSDictionary *myInfo = @{@"text": self.textField.text};
    //定义一个通知
    NSNotification *valueChange = [[NSNotification alloc] initWithName:@"change" object:nil userInfo:myInfo];
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotification:valueChange];
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
