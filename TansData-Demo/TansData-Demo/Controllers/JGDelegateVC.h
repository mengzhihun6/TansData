//
//  JGDelegateVC.h
//  TansData-Demo
//
//  Created by 郭军 on 16/8/20.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import "JGBasicViewController.h"

@protocol JGDelegateVCDelegate <NSObject>
@optional
//传值使用的方法
- (void)tansDataWithString:(NSString *)text;

@end

@interface JGDelegateVC : JGBasicViewController

/** 协议 */
@property (nonatomic, weak) id<JGDelegateVCDelegate> delegate;

@end
