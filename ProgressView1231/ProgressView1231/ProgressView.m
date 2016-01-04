//
//  ProgressView.m
//  ProgressView1231
//
//  Created by 123 on 16/1/4.
//  Copyright © 2016年 北京物网科技有限公司. All rights reserved.
//

#import "ProgressView.h"
#import "ArcCircleLayer.h"

@interface ProgressView ()

@property (nonatomic, strong) ArcCircleLayer *circleLayer;

@end

@implementation ProgressView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        ArcCircleLayer *circleLayer = [[ArcCircleLayer alloc] init];
        circleLayer.position = CGPointMake(CGRectGetWidth(frame)/2, CGRectGetHeight(frame)/2);
        circleLayer.bounds = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        [self.layer addSublayer:circleLayer];
        self.circleLayer = circleLayer;
        
    }
    
    return self;
}

- (void)show{
    _circleLayer.progress = 1;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = 5;
    animation.fromValue = @0.0;
    animation.toValue = @1.0;
    [_circleLayer addAnimation:animation forKey:nil];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
