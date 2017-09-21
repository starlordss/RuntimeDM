//
//  Model.h
//  快速归档
//
//  Created by Zahi on 2017/9/22.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject<NSCoding>


@property (nonatomic, strong) NSString *str;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *time;

@end
