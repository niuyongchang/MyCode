//
//  ViewController.m
//  PieView
//
//  Created by 牛永昌 on 16/1/5.
//  Copyright © 2016年 牛永昌. All rights reserved.
//

#import "ViewController.h"
#import "PieView.h"

@interface ViewController ()

@property (nonatomic, strong) PieView *pieView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    PieView *pieView = [[PieView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    pieView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pieView];
    self.pieView = pieView;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.pieView showAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
