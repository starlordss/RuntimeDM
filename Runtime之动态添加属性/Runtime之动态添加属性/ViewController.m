//
//  ViewController.m
//  Runtime之动态添加属性
//
//  Created by Zahi on 2017/6/28.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Objc.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSObject *objc = [NSObject new];
    
    objc.name = @"啧啧啧";
    
    
    NSLog(@"%@",objc.name);
    
}



@end
