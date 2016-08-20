//
//  ViewController.m
//  TansData-Demo
//
//  Created by 郭军 on 16/8/20.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import "ViewController.h"
#import "JGDelegateVC.h"
#import "JGBlockVC.h"
#import "JGTextSingleton.h"


#define kDeviceWidth [UIScreen mainScreen].bounds.size.width

//声明一个外部全局变量
extern NSString *myText;

@interface ViewController ()<JGDelegateVCDelegate> {
    
    UILabel *_myLbl;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:nil];
    
    
    self.view.backgroundColor = [UIColor cyanColor];
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    UILabel *lbl = [[UILabel alloc] initWithFrame:titleView.bounds];
    lbl.text = @"视图控制器之间的传值";
    lbl.font = [UIFont systemFontOfSize:20];
    lbl.textAlignment = NSTextAlignmentCenter;
    [titleView addSubview:lbl];
    lbl.textColor = [UIColor redColor];
    
    
    self.navigationItem.titleView = titleView;
    
    
//    self.title = @"视图控制器之间的传值";
    
    [self createSubViews];
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modifyLable:) name:@"change" object:nil];
    
    
}

- (void)createSubViews {
    
    //1. 创建标签
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, kDeviceWidth, 40)];
    [self.view addSubview:lbl];
    
    lbl.backgroundColor = [UIColor whiteColor];
    lbl.text = @"未改动前标签";
    lbl.font = [UIFont systemFontOfSize:24];
    lbl.textAlignment = NSTextAlignmentCenter;
    
    //给成员变量赋值
    _myLbl = lbl;
    
    //2. 创建按钮
    NSArray *btnNames = @[@"Delegate", @"Block", @"Notification", @"Global", @"Singleton"];
    for (int i = 0; i < btnNames.count; i++) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 200 + 60 * i, kDeviceWidth - 100, 40)];
        [self.view addSubview:btn];
        [btn setTitle:btnNames[i] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"login_btn_n"] forState:UIControlStateNormal];
        btn.tag = 10 + i;
        
        //添加事件
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)btnClicked:(UIButton *)button {
    
    switch (button.tag - 10) {
        case 0:
            [self goToViewController:@"JGDelegateVC"];
            break;
        case 1:
            [self goToViewController:@"JGBlockVC"];
            break;
        case 2:
            [self goToViewController:@"JGNotificationVC"];
            break;
        case 3:
            [self goToViewController:@"JGGlobalVC"];
            break;
        case 4:
            [self goToViewController:@"JGSingletonVC"];
            break;
        default:
            break;
    }
    
    
    
}


- (void)goToViewController:(NSString *)className {
   
    //把字符串转换成类
    Class class = NSClassFromString(className);
    
    //通过class定义一个控制器对象
    id vc = [[class alloc] init];
    
#warning 1. 代理传值----------
    if ([className isEqualToString:@"JGDelegateVC"]) {
        JGDelegateVC *deldgateVC = (JGDelegateVC *)vc;
        deldgateVC.delegate = self; //值修改在下边代理方法中
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
#warning 2. Block传值------------
    if ([className isEqualToString:@"JGBlockVC"]) {
        JGBlockVC *blockVC = (JGBlockVC *)vc;
        blockVC.block = ^(NSString *text){
            _myLbl.text = text;
        };
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    
    
    //跳转
    [self.navigationController pushViewController:vc animated:YES];
}



#pragma mark - 代理传值 -
- (void)tansDataWithString:(NSString *)text {
    _myLbl.text = text;
}

#warning 通知传值 ----- 
- (void)modifyLable:(NSNotification *)noti {
    
    NSDictionary *userInfo = noti.userInfo;
    _myLbl.text = userInfo[@"text"];
    
}

#warning 全局变量改值----
//- (void)viewWillAppear:(BOOL)animated {
//    _myLbl.text = myText;
//}
#warning 单例传值----
- (void)viewWillAppear:(BOOL)animated {
    _myLbl.text = [JGTextSingleton shareText].text;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
