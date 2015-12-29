//
//  ViewController.m
//  RepeatAdvertisingView
//
//  Created by 牛永昌 on 15/12/29.
//  Copyright © 2015年 牛永昌. All rights reserved.
//

#import "ViewController.h"
#import "RepeatAdvertisingView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RepeatAdvertisingView *view = [[RepeatAdvertisingView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200)];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
