//
//  ProgressView.m
//  Drawing1230
//
//  Created by 123 on 15/12/31.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width/2, rect.size.height/2) radius:MIN(rect.size.width/2-10, rect.size.height/2-10) startAngle:M_PI*3/2+(M_PI*3/2*self.progress) endAngle:M_PI+(M_PI*3*self.progress) clockwise:NO];
    CGContextSetLineWidth(ctx, 2);
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
    
    
}


@end
