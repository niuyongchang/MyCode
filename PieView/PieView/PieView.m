//
//  PieView.m
//  PieView
//
//  Created by 牛永昌 on 16/1/5.
//  Copyright © 2016年 牛永昌. All rights reserved.
//

#import "PieView.h"
#import "BigCirCleLayer.h"
#define BigCircleRadius ((self.frame.size.width - 10)/2)

@implementation PieView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        BigCirCleLayer *baseLayer = [BigCirCleLayer layer];
        
        baseLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        baseLayer.position = CGPointMake(frame.size.width/2, frame.size.height/2);
        baseLayer.backgroundColor = [UIColor whiteColor].CGColor;
//        baseLayer.cornerRadius = BigCircleRadius;
//        baseLayer.borderWidth = 2;
//        baseLayer.borderColor = [UIColor redColor].CGColor;
//        baseLayer.opacity = 0.5;
        [self.layer addSublayer:baseLayer];
        [baseLayer setNeedsDisplay];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    path.lineWidth = 5;
//    CGFloat radius = BigCircleRadius - 4.5;
//    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.width/2);
//    CGFloat start = M_PI * 8 / 7;
//    CGFloat end = M_PI;
//    [path addArcWithCenter:center radius:radius startAngle:start endAngle:end clockwise:NO];
//    
//    [path stroke];
////    NSString *str = @"押";
////    [str drawAtPoint:CGPointMake(10, self.frame.size.width/2 - 10) withAttributes:nil];
//    CGFloat centerToPoint = radius + 3/2;
//    CGPoint littleCenter = CGPointMake(self.frame.size.width/2 - cosf((start - end)/2)*centerToPoint, self.frame.size.height/2 - sinf((start - end)/2)*centerToPoint);
//    UIBezierPath *littleCircle = [UIBezierPath bezierPathWithArcCenter:littleCenter radius:10 startAngle:0 endAngle:M_PI * 2 clockwise:NO];
//
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
//    CGContextAddPath(ctx, littleCircle.CGPath);
////    CGContextset
//    CGContextFillPath(ctx);
}


- (void)showAnimation{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(M_PI * 2);
    animation.toValue = @0;
    animation.duration = 1;
//    [self.layer addAnimation:animation forKey:nil];
    
//    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    animation2.fromValue = @0;
//    animation2.toValue = @(M_PI * 2);
//    [self.layer.sublayers[0] addAnimation:animation2 forKey:nil];
    
    
}

@end
