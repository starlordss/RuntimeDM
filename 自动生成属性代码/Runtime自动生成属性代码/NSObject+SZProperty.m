//
//  NSObject+SZProperty.m
//  Runtime自动生成属性代码
//
//  Created by Zahi on 2017/6/30.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "NSObject+SZProperty.h"

@implementation NSObject (SZProperty)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict
{
    
    NSMutableString *strM = [NSMutableString string];
    
    
    

    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSLog(@"%@:%@",key , [obj class]);
        
        NSString *code;
        
        // 判断值类型--
        if ([obj isKindOfClass:[NSString class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@",key];
            
        } else if ([obj isKindOfClass:[NSDictionary class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@",key];
            
        } else if ([obj isKindOfClass:[NSArray class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@",key];
        } else if ([obj isKindOfClass:[NSNumber class]]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@",key];
            
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@",key];
        }
        
        // 拼接字符串
        [strM appendFormat:@"\n%@\n",code];
        
    }];
    
    NSLog(@"%@",strM);
}

@end
