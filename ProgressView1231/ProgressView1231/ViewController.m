//
//  ViewController.m
//  ProgressView1231
//
//  Created by 123 on 16/1/4.
//  Copyright © 2016年 北京物网科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"
@interface ViewController ()
@property (nonatomic, strong) ProgressView *pv;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ProgressView *pv = [[ProgressView alloc] initWithFrame:CGRectMake(50, 100, 100, 200)];
    [self.view addSubview:pv];
    self.pv = pv;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 80, 40)];
    [button setTitle:@"start" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)start{
    [self.pv show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
