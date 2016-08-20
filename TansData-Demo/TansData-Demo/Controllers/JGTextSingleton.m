//
//  JGTextSingleton.m
//  TansData-Demo
//
//  Created by 郭军 on 16/8/20.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import "JGTextSingleton.h"

@implementation JGTextSingleton

+ (instancetype)shareText {
    
    static JGTextSingleton *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JGTextSingleton alloc] init];
    });
    return instance;
}


@end
