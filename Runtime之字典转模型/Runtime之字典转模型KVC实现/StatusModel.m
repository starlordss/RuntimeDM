//
//  StatusModel.m
//  Runtime自动生成属性代码
//
//  Created by Zahi on 2017/6/30.
//  Copyright © 201ahi. All rights reserved.
//

#import "StatusModel.h"

@implementation StatusModel

/**
 * [mode setValue:@"value"forKey:@"key"];
 * 1.首先去模型中查找有没有setKey，找到直接调用赋值[self setKey:value];
 * 2.然后去模型中查找有没有key属性,有，直接访问属性赋值 key = value
 * 3.去模型中查找有没有_key属性，有,直接赋值_key = value
 * 4.找不到，机会直接报错setValue:forUndefinedKey:
 */
+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    StatusModel *model = [[self alloc] init];
    
    // KVC:把字典中的所有值给模型的属性赋值
    
    /**
     * KVC原理：
     
     1.遍历字典中所有的key，去模型中查找有没有对应的属性
     [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
     
        2、去模型中查找有没有对应属性KVC
        [model setValue:value forKey:key];
     
     }];
     */
    [model setValuesForKeysWithDictionary:dict];
    
    
    
    /**
     * 每拿到一个模型属性，去字典中去对应的值，给模型赋值
     * 从字典中取值，不一定要全部取出来
     */
    
    return model;
}

/**
 * 重写系统方法
 * 1.给系统添加额外功能
 * 2.不想系统实现
 
 * 系统找不到就会调用这个方法
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}




@end
