//
//  UIViewController+Swizzling.m
//  Method Swizzling
//
//  Created by Zahi on 2017/9/17.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/message.h>

@implementation UIViewController (Swizzling)


/**
 * 方法交换对于我来说更像是实现一种思想的最佳技术：AOP面向切面编程。
 * 既然是切面，就一定不要忘记，交换完再调回自己
 */

// load方法会在类第一次加载的时候被调用
+ (void)load
{
    // 方法交换应保证，在程序中只会调用一次
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        // 获取viewController的生命周期方法
        SEL systemSel = @selector(viewWillAppear:);
        // 需要被交换的方法
        SEL swizzlingSel = @selector(sz_viewWillAppear:);
        // 获取Method
        Method systemMehod = class_getInstanceMethod(self, systemSel);
        Method swizzlingMthod = class_getInstanceMethod(self, swizzlingSel);
        
        // 动态添加方法 实现的是被交换二方法 返回值表示添加成功或失败
        BOOL isAdd = class_addMethod([self class], systemSel, method_getImplementation(swizzlingMthod), method_getTypeEncoding(swizzlingMthod));
        //如果类中已经有了可替换的方法，那么就调用method_exchangeImplementations交换，否则调用class_addMethod和class_replaceMethod来完成替换。
        if (isAdd) { // 添加成功 说明类中不存在这个方法的实现
            //将被交换方法的实现替换到这个并不存在的实现
            class_replaceMethod(self, swizzlingSel, method_getImplementation(systemMehod), method_getTypeEncoding(systemMehod));
        } else { // 添加失败
            method_exchangeImplementations(systemMehod, swizzlingMthod);
        }
    });
}

- (void)sz_viewWillAppear:(BOOL)animated{
    
    //这时候调用自己，看起来像是死循环
    //但是其实自己的实现已经被替换了
    [self sz_viewWillAppear:animated];
    
    NSLog(@"swizzling");
}
@end
