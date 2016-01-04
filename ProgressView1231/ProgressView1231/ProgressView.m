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
@property (nonatomic, strong) CAShapeLayer *littleLayer;

@end

@implementation ProgressView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        ArcCircleLayer *circleLayer = [[ArcCircleLayer alloc] init];
        circleLayer.position = CGPointMake(CGRectGetWidth(frame)/2, CGRectGetHeight(frame)/2);
        circleLayer.bounds = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        [self.layer addSublayer:circleLayer];
        self.circleLayer = circleLayer;
        
        [self addLittleLayer];
        
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
    
    [self littleLayerAnimate];
}

- (void)addLittleLayer{
    
    self.littleLayer = [CAShapeLayer layer];
    self.littleLayer.frame = self.bounds;
    [self.layer addSublayer:self.littleLayer];
    
}

- (void)littleLayerAnimate{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat radius = circle_radius * 5 / 2;
    CGPoint center = CGPointMake(self.circleLayer.position.x - circle_radius * 3 / 2 , self.circleLayer.position.y);
    
    //o
    CGFloat origin = M_PI * 2;
    
    //d
    
    CGFloat dest = M_PI * 2 - asin(2 * circle_radius / radius);
    
    [path addArcWithCenter:center radius:radius startAngle:origin endAngle:dest clockwise:NO];
    self.littleLayer.path = path.CGPath;
    self.littleLayer.strokeColor = [UIColor blueColor].CGColor;
    self.littleLayer.lineWidth = 3;
    self.littleLayer.fillColor = nil;
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.fromValue = @0.0;
    animation.toValue = @0.9;
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
