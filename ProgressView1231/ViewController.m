//
//  ViewController.m
//  ProgressView1231
//
//  Created by 123 on 15/12/31.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    ProgressView *pv = [[ProgressView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    pv.progress = 0;
    pv.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pv];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(change:) userInfo:pv repeats:YES];
}

- (void)change:(NSTimer *)timer{

    ProgressView *pv = timer.userInfo;
    
    pv.progress += 0.1;
    
    [pv setNeedsDisplay];
    
    if (pv.progress >= 1) [timer invalidate];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
