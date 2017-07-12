//
//  ViewControllerB.h
//  DelegateDemo
//
//  Created by 李峰 on 2017/7/12.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import <UIKit/UIKit.h>

//创建协议
@protocol VcBDelegate <NSObject>
- (void)sendValue:(NSString *)value; //声明协议方法
@end

@interface ViewControllerB : UIViewController
@property (nonatomic, weak)id<VcBDelegate> delegate; //声明协议变量
@end
