//
//  ViewController.m
//  快速归档
//
//  Created by Zahi on 2017/9/22.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
@interface ViewController ()

@end

#define filePath @"/Users/zahi/Desktop/test.archiver"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Model *m = [Model new];
    
    m.name = @"大炮";
    m.time = @"22号";
    m.str = @"这是字符串";
    
    
    
   BOOL isOK = [NSKeyedArchiver archiveRootObject:m toFile:filePath];
    
    if (isOK ) {
        NSLog(@"归档成功");
    }
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    Model *m =  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"%@",m);
}


@end
