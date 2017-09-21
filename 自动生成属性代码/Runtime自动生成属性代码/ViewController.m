//
//  ViewController.m
//  Runtime自动生成属性代码
//
//  Created by Zahi on 2017/6/30.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+SZProperty.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self demo];
}

- (void)demo
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    
    [NSObject createPropertyCodeWithDict:dict];
    
    
}

@end
