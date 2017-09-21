//
//  Person.m
//  01-Runtime_消息机制
//
//  Created by Zahi on 16/7/16.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "Person.h"

@implementation Person


+ (void)eat {
    NSLog(@"%s",__func__);
}


- (void)run {
    NSLog(@"%s",__func__);
}
@end
