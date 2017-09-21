//
//  StatusModel.h
//  Runtime自动生成属性代码
//
//  Created by Zahi on 2017/6/30.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>


@class User;
@interface StatusModel : NSObject

// 自动生成属性 通过 字典
@property (nonatomic, assign) NSInteger reposts_count;

@property (nonatomic, strong) NSArray *pic_urls;

@property (nonatomic, strong) NSString *created_at;

@property (nonatomic, assign) NSInteger attitudes_count;

@property (nonatomic, strong) NSString *idstr;

@property (nonatomic, strong) NSString *text;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, strong) User *user;

//+ (instancetype)statusWithDict:(NSDictionary *)dict;

@end
