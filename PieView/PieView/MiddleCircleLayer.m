//
//  MiddleCircleLayer.m
//  PieView
//
//  Created by 123 on 16/1/7.
//  Copyright © 2016年 牛永昌. All rights reserved.
//

#import "MiddleCircleLayer.h"

@implementation MiddleCircleLayer


- (void)drawInContext:(CGContextRef)ctx{
    
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    CGFloat radius = self.bounds.size.width/2 - 10;
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [bezier addArcWithCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:NO];
    CGContextAddPath(ctx, bezier.CGPath);
    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextFillPath(ctx);
    
    //圆弧
    UIBezierPath *arc = [UIBezierPath bezierPath];
    CGFloat arcRadius = radius - 4;
    CGPoint arcCenter = center;
    CGFloat arcStart =2*M_PI - M_PI * 3 / 7;
    CGFloat arcEnd = 2*M_PI - M_PI / 7;
    [arc addArcWithCenter:arcCenter radius:arcRadius startAngle:arcStart endAngle:arcEnd clockwise:YES];
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(ctx, 5);
    CGContextAddPath(ctx, arc.CGPath);
    CGContextStrokePath(ctx);
    
    //小圆
    UIBezierPath *littleCircle = [UIBezierPath bezierPath];
    CGFloat littleRadius = 15;
    CGFloat distance = arcRadius;
    CGPoint littleCenter = CGPointMake(self.bounds.size.width/2 - cosf((arcStart - arcEnd)/2+arcEnd - M_PI)*distance, self.bounds.size.height/2 - sinf((arcStart - arcEnd)/2+arcEnd-M_PI)*distance);
    [littleCircle addArcWithCenter:littleCenter radius:littleRadius startAngle:0 endAngle:M_PI*2 clockwise:NO];
    CGContextSetLineWidth(ctx, 1);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddPath(ctx, littleCircle.CGPath);
    CGContextStrokePath(ctx);
    
}

- (void)showAnimation{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(M_PI * 2);
    animation.toValue = @0;
    animation.duration = 1;
//    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self addAnimation:animation forKey:nil];
}

@end
