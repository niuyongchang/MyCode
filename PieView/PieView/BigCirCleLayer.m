//
//  BigCirCleLayer.m
//  PieView
//
//  Created by 牛永昌 on 16/1/5.
//  Copyright © 2016年 牛永昌. All rights reserved.
//

#import "BigCirCleLayer.h"

@implementation BigCirCleLayer

- (void)drawInContext:(CGContextRef)ctx{
    //大圆
    UIBezierPath *bigCircle = [UIBezierPath bezierPath];
    CGPoint bigCenter = CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2);
    CGFloat bigRadius = self.bounds.size.width/2 - 10;//给上下左右各留10
    CGFloat start = 0;
    CGFloat end = M_PI * 2;
    [bigCircle addArcWithCenter:bigCenter radius:bigRadius startAngle:start endAngle:end clockwise:NO];
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextSetLineWidth(ctx, 2);
    CGContextAddPath(ctx, bigCircle.CGPath);
    CGContextStrokePath(ctx);
    
    //圆弧
    UIBezierPath *arc = [UIBezierPath bezierPath];
    CGFloat arcRadius = bigRadius - 4;
    CGPoint arcCenter = CGPointMake(self.frame.size.width/2, self.frame.size.width/2);
    CGFloat arcStart = M_PI * 10 / 7;
    CGFloat arcEnd = M_PI * 8 / 7;
    [arc addArcWithCenter:arcCenter radius:arcRadius startAngle:arcStart endAngle:arcEnd clockwise:NO];
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
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
    
    //文字
    CGContextSetLineWidth(ctx, 1);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    NSString *string = @"押";
    CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    [string drawAtPoint:CGPointMake(littleCenter.x - size.width/2, littleCenter.y - size.height/2) withAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    CGContextStrokePath(ctx);
}

- (void)showAnimation{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = @(M_PI * 2);
    animation.duration = 1;
    [self addAnimation:animation forKey:nil];
    
}

@end
