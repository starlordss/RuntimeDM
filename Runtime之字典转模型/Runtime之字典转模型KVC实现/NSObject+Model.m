//
//  NSObject+Model.m
//  Runtime之字典转模型KVC实现
//
//  Created by Zahi on 2017/7/11.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/message.h>

@implementation NSObject (Model)
/// 字典转模型
+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    
    id objc = [[self alloc] init];
    
    /**
     * runtime:根据模型中的属性，去字典中取出对应的value给模型属性赋值
     * 1.获取模型中所有成员变量Key
     * 2.获取那个类的成员变量
     * 3.给模型中的属性赋值KVC
     */
    //count：成员变量的个数
    unsigned int outCount;
    // 获取成员变量数组
    Ivar *ivarList = class_copyIvarList(self, &outCount);
    
    // 遍历所有的成员变量
    for (int i = 0; i < outCount; i++) {
        
        // 获取成员变量
        Ivar ivar = ivarList[i];
        
        // 获取成员变量名字
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        
        // 获取成员变量类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        NSLog(@"%@",ivarType);
        //@"User" - > User
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        // 获取key
        NSString *key = [ivarName substringFromIndex:1];
//        NSLog(@"%@",key);
        // 获取字典中对应的value
        id value = dict[key];
        // 判断value是否是字典 and 变量类型是否是自定义的对象，如果是，字典转模型
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"]) {
            // 获取模型的类
            Class modelClass = NSClassFromString(ivarType);
            // 字典转模型
            value = [modelClass modelWithDict:value];
        }
        
        // 给模型中属性赋值
        if (value) {
            // KVC给对象属性赋值
            [objc setValue:value forKey:key];
            
            NSLog(@"%@",value);
        }
    }

    return objc;
    
    
}

@end
