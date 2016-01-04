//
//  ArcCircleLayer.m
//  ProgressView1231
//
//  Created by 123 on 16/1/4.
//  Copyright © 2016年 北京物网科技有限公司. All rights reserved.
//

#import "ArcCircleLayer.h"

@implementation ArcCircleLayer

+ (BOOL)needsDisplayForKey:(NSString *)key{
    
    if ([key isEqualToString:@"progress"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat radius = circle_radius;
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    //o
    CGFloat originStart = M_PI * 7 / 2;
    CGFloat originEnd = M_PI * 2;
    CGFloat currentOrigin = originStart - (originStart - originEnd) * self.progress;
    
    //d
    CGFloat destStart = M_PI * 3;
    CGFloat destEnd = 0;
    CGFloat currentDest = destStart - (destStart - destEnd) * self.progress;
    
    [path addArcWithCenter:center radius:radius startAngle:currentOrigin endAngle:currentDest clockwise:NO];
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetLineWidth(ctx, 5);
    CGContextSetStrokeColorWithColor(ctx, [UIColor greenColor].CGColor);
    CGContextStrokePath(ctx);
    
    
}


@end
