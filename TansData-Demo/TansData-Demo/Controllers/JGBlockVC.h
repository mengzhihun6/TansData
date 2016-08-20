//
//  JGBlockVC.h
//  TansData-Demo
//
//  Created by 郭军 on 16/8/20.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import "JGBasicViewController.h"

typedef void (^tansDataBlock)(NSString *text);

@interface JGBlockVC : JGBasicViewController

/** Block  */
@property (nonatomic, copy) tansDataBlock block;


@end
