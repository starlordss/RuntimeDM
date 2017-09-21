//
//  ViewController.m
//  01-Runtime_消息机制
//
//  Created by Zahi on 16/7/16.
//  Copyright © 2016年 Zahi. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

#import <objc/message.h>


@interface ViewController ()

@end

@implementation ViewController


/**
 *  使用第一步：导入头文件message
 *  Build Setting -> 搜索msg -> 设置属性为No
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *   OC:运行时机制,消息机制是运行时机制最重要的机制
     *   消息机制:任何方法调用,本质都是发送消息
     */
    
    Person *p = [[Person alloc] init];
    
    objc_msgSend(p, @selector(run));
    
    
    //获取类对象
    // 类名调用类方法,本质类名转换成类对象
    Class personClass = [Person class];
    
    //运行时
    objc_msgSend(personClass, @selector(eat));
}


@end
