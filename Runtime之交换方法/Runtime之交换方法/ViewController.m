//
//  ViewController.m
//  Runtime之交换方法
//
//  Created by Zahi on 2017/6/27.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "ViewController.h"
    

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     * 通过运行时 把imageName:改成了sz_imageNamed:
     */
    UIImage *img = [UIImage imageNamed:@"123"];
}


@end
