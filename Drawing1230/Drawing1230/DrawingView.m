//
//  DrawingView.m
//  Drawing1230
//
//  Created by 123 on 15/12/30.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 20, 20);
    CGPathAddLineToPoint(path, NULL, 20, 320);
    
    CGContextAddPath(ctx, path);
    CGContextStrokePath(ctx);
    
    CGMutablePathRef horizonPath = CGPathCreateMutable();
    CGPathMoveToPoint(horizonPath, NULL, 20, 320);
    CGPathAddLineToPoint(horizonPath, NULL, 320, 320);
    CGContextAddPath(ctx, horizonPath);
    CGContextStrokePath(ctx);
    CGPathRelease(path);
    CGPathRelease(horizonPath);
    
    //x轴标注
    CGFloat startX = 30;
    for (int i = 0; i < 10; i++) {
        CGSize size = [[NSString stringWithFormat:@"%.f",startX] sizeWithAttributes:nil];
        [[NSString stringWithFormat:@"%.f",startX] drawAtPoint:CGPointMake(startX-size.width/2, 320) withAttributes:nil];
        
        startX += 25;
    }
    
    
    //折线
    
    CGPoint fromPoint = CGPointMake(30, 30);
    for (int i = 0; i < 10; i++) {
        CGPoint toPoint = CGPointMake(fromPoint.x + 25, arc4random()%300+20);
        [self drawLineFrom:fromPoint to:toPoint inContext:ctx];
        fromPoint = CGPointMake(toPoint.x, toPoint.y);
    }
    [self drawTriangleInContext:ctx];
}

- (void)drawLineFrom:(CGPoint)fromPoint to:(CGPoint)toPoint inContext:(CGContextRef)ctx{
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, fromPoint.x, fromPoint.y);
    CGPathAddLineToPoint(path, NULL, toPoint.x, toPoint.y);
    
    CGContextAddPath(ctx, path);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    
    
    CGContextStrokePath(ctx);
    
    CGPathRelease(path);
}
//画实心三角形
- (void)drawTriangleInContext:(CGContextRef)ctx{
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, self.bounds.size.height);
    CGPathAddLineToPoint(path, NULL, 50, self.bounds.size.height - 50*sqrtf(3));
    CGPathAddLineToPoint(path, NULL, 100, self.bounds.size.height);
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    CGContextSetFillColorWithColor(ctx, [UIColor purpleColor].CGColor);
    CGPathRelease(path);
}


@end
