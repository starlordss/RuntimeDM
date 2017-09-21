//
//  ViewController.m
//  Runtime之字典转模型KVC实现
//
//  Created by Zahi on 2017/7/11.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Model.h"
#import "StatusModel.h"
#import "NSDictionary+SZProperty.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
//    [dict[@"user"] createPropertyCode];
    
    
    StatusModel *model = [StatusModel modelWithDict:dict];
    
//    NSLog(@"%@",model.user);
    

}


@end
