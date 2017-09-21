//
//  NSDictionary+SZProperty.h
//  Runtime之字典转模型KVC实现
//
//  Created by Zahi on 2017/7/11.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SZProperty)


- (void)createPropertyCode;

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict;
@end
