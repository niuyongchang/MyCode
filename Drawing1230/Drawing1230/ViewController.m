//
//  ViewController.m
//  Drawing1230
//
//  Created by 123 on 15/12/30.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    DrawingView *view = [[DrawingView alloc] initWithFrame:CGRectMake(10, 40, 320, 340)];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(change:) userInfo:view repeats:YES];
    UIImage *image = [UIImage imageNamed:@"image_01.jpg"];
    [self resizeImage:image];
}

- (void)resizeImage:(UIImage *)image{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width/2, image.size.height/2), NO, 0);
    [image drawAtPoint:CGPointMake(-image.size.width/2, -image.size.height/2)];//可以视为：新的矩形以原图的左上角为原点，向右和向下偏移的值（即负值）
    UIImage *im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:im];
    imageView.frame = CGRectMake(10, 400, self.view.frame.size.width-20, 200);
    [self.view addSubview:imageView];
}

- (void)change:(NSTimer *)timer{
    DrawingView *view = timer.userInfo;
    [view setNeedsDisplay];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
