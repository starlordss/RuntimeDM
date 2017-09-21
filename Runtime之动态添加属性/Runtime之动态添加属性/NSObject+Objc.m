//
//  NSObject+Objc.m
//  Runtime之动态添加属性
//
//  Created by Zahi on 2017/6/28.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "NSObject+Objc.h"
#import <objc/message.h>

@implementation NSObject (Objc)


- (void)setName:(NSString *)name
{
    /**
     * 添加属性和对象 给某个对象产生关联，添加属性
     * @param object:给那个对象添加属性
     * @param key:根据key去获取关联的对象 void * == id
     * @param value:关联属性的值
     * @param policy:内存存储策略
     */
    
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSString *)name
{
    
    /**
     * 获取关联对象的属性值
     * @param object 获取那个属性的对象
     * @param key 根据key值去获取属性值
     */
    return objc_getAssociatedObject(self, @"name");
}
@end
