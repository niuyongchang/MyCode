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
@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, strong) CALayer *blueLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    PieView *pieView = [[PieView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    pieView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pieView];
    self.pieView = pieView;
    
    [self hitTest];
}

- (void)hitTest{
    
    self.redLayer = [CALayer layer];
    self.redLayer.frame = CGRectMake(50, 300, 50, 50);
    self.redLayer.backgroundColor = [UIColor redColor].CGColor;
    self.redLayer.zPosition = 10;
    [self.view.layer addSublayer:self.redLayer];
    
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(60, 310, 30, 30);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:self.blueLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [[touches anyObject] locationInView:self.view];
    CALayer *touchedLayer = [self.view.layer hitTest:point];
    
    NSLog(@"%@",[touchedLayer isEqual:self.redLayer] ? @"red" : @"blue");
    
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
