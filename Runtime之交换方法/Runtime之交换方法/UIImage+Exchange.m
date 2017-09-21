//
//  UIImage+Exchange.m
//  Runtime之交换方法
//
//  Created by Zahi on 2017/6/27.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "UIImage+Exchange.h"
#import <objc/message.h>

@implementation UIImage (Exchange)

/**
 * 只要你动态加载或者静态引用了这个类，那么load就会被执行，
 * 它并不需要你显示的去创建一个类后才会执行，
 * 同时只执行一次。
 */
+ (void)load
{
 
    // 获取"类方法"的某个方法
    Method m1 = class_getClassMethod(self, @selector(imageNamed:));
    
    Method m2 = class_getClassMethod(self, @selector(sz_imageNamed:));
    
    
    // 交换方法的实现
    method_exchangeImplementations(m1, m2);
}


+ (__kindof UIImage *)sz_imageNamed:(NSString *)name
{
    UIImage *img = [UIImage sz_imageNamed:name];
    
    if (img == nil) {
        NSLog(@"图片为空");
    }
    return img;
}

@end
