//
//  JGTextSingleton.h
//  TansData-Demo
//
//  Created by 郭军 on 16/8/20.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGTextSingleton : NSObject
/** text  */
@property (nonatomic, copy) NSString *text;

+ (instancetype)shareText;

@end
