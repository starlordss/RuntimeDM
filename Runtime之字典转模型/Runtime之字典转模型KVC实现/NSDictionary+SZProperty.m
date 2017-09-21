//
//  NSDictionary+SZProperty.m
//  Runtime之字典转模型KVC实现
//
//  Created by Zahi on 2017/7/11.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "NSDictionary+SZProperty.h"

@implementation NSDictionary (SZProperty)

- (void)createPropertyCode
{
    NSMutableString *strM = [NSMutableString string];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSLog(@"%@:%@",key , [obj class]);
        
        NSString *code;
        
        // 判断值类型--
        if ([obj isKindOfClass:[NSString class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",key];
            
        } else if ([obj isKindOfClass:[NSDictionary class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",key];
            
        } else if ([obj isKindOfClass:[NSArray class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",key];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",key];
        } else if ([obj isKindOfClass:[NSNumber class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;",key];
            
        }
        
        // 拼接字符串
        [strM appendFormat:@"\n%@\n",code];
        
    }];
    
    NSLog(@"%@",strM);
}

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict
{
    
    NSMutableString *strM = [NSMutableString string];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSLog(@"%@:%@",key , [obj class]);
        
        NSString *code;
        
        // 判断值类型--
        // 判断值类型--
        if ([obj isKindOfClass:[NSString class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",key];
            
        } else if ([obj isKindOfClass:[NSDictionary class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",key];
            
        } else if ([obj isKindOfClass:[NSArray class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",key];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",key];
        } else if ([obj isKindOfClass:[NSNumber class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;",key];
        }
        // 拼接字符串
        [strM appendFormat:@"\n%@\n",code];
        
    }];
    
    NSLog(@"%@",strM);
}


@end
