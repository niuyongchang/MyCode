//
//  ViewController.m
//  cgtest
//
//  Created by 123 on 15/7/21.
//  Copyright (c) 2015年 北京物网科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CustomView *view = [[CustomView alloc] initWithFrame:self.view.bounds];
//    view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view];
    
    

    

    
}

- (void)drawArrowUsingUIKit{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [[UIColor orangeColor] set];
    [path moveToPoint:CGPointMake(160, 40)];
    [path addLineToPoint:CGPointMake(190, 90)];
    [path addLineToPoint:CGPointMake(130, 90)];
    [path fill];
    [path removeAllPoints];
    
    [[UIColor blueColor] set];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
