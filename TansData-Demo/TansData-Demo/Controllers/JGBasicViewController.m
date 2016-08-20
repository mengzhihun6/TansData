//
//  JGBasicViewController.m
//  TansData-Demo
//
//  Created by 郭军 on 16/8/20.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import "JGBasicViewController.h"

@interface JGBasicViewController ()

@end

@implementation JGBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = NSStringFromClass(self.class);
    float red = arc4random() % 255 / 255.0;
    float green = arc4random() % 255 / 255.0;
    float blue = arc4random() % 255 / 255.0;
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    [self createSubViews];
    

}

- (void)createSubViews {
    
    //1. 文本框
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 300, 40)];
    [self.view addSubview:textField];
    textField.backgroundColor = [UIColor whiteColor];
    
    //1.1 赋值
    _textField = textField;
    
    
    //2. 按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 300, 40)];
    [self.view addSubview:btn];
    [btn setTitle:@"修改数据" forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"login_btn_n"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(modifiData) forControlEvents:UIControlEventTouchUpInside];
}


- (void)modifiData {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
