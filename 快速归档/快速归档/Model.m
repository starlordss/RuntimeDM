//
//  Model.m
//  快速归档
//
//  Created by Zahi on 2017/9/22.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "Model.h"
#import <objc/runtime.h>

@implementation Model


// 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        unsigned int outCount = 0 ;
        Ivar *ivar = class_copyIvarList(self.class, &outCount);
        
        for (int i = 0; i < outCount; i++) {
            
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar[i])];
            NSLog(@"%@",key);
            id value = [aDecoder decodeObjectForKey:key];
            NSLog(@"%@",value);
            [self  setValue:value forKey:key];
            
        }
        
    }
    
    
    return self;
}

// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int outCount = 0;
    Ivar *ivarList = class_copyIvarList([self class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivarList[i])] ;
        
        id value = [self valueForKey:key];
        
        [aCoder encodeObject:value forKey:key];
        
        
    }
    
//    [aCoder encodeObject:_str forKey:@"str"];
//    [aCoder encodeObject:_time forKey:@"time"];
//    [aCoder encodeObject:_name forKey:@"name"];
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %@",self.name,self.str,self.time];
}

@end
