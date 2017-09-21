//
//  Person.m
//  Runtime之动态添加方法
//
//  Created by Zahi on 2017/6/27.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

/**
 *  方法的实现
 *
 *  @param self  方法调用者
 *  @param _cmd  调用方法的编号
 *  @param param 参数
 *  默认一个方法都有两个参数self，_cmd，隐式参数
 */
void IMPRun(id self, SEL _cmd, id param)
{
    NSLog(@"调用了run：%@ | %@ | %@",self, NSStringFromSelector(_cmd),param);
}


/**
 *  动态添加方法--首先实现这个resolveInstanceMethod
 *  resolveInstanceMethod调用：当调用了没有实现的方法就会调用
 *  resolveInstanceMethod作用：就知道那些方法没有实现，从而动态添加方法
 *  sel:没有实现的方法
 *
 */


+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    
    
    if (sel == @selector(run:)) {
        
        /**
         *  cls：给那个类添加方法
         *  SEL: 添加方法的方法编号
         *  IMP：方法的实现--函数的入口（函数名）
         *  types:方法类型
         */
        //class_addMethod(__unsafe_unretained Class cls, SEL name, IMP imp, const char *types)
        class_addMethod(self, sel, (IMP)IMPRun, "v@:@");
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

- (void)run:(NSNumber *)m
{
    NSLog(@"%@",m);
}

@end
