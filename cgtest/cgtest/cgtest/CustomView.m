//
//  CustomView.m
//  cgtest
//
//  Created by 123 on 15/7/21.
//  Copyright (c) 2015年 北京物网科技有限公司. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()
@property (nonatomic,strong) LayerDelegate *layerDelegate;
@end

@implementation CustomView

- (void)drawRect:(CGRect)rect {
/*
    //1.
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    [[UIColor blueColor] setFill];
    [path fill];
    */

/*
    //2.
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(100, 100, 100, 100));
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextFillPath(context);
    */
    
/*绘制箭头
    //1.
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextMoveToPoint(context, 160, 40);
    CGContextAddLineToPoint(context, 190, 60);
    CGContextAddLineToPoint(context, 130, 60);
    CGContextFillPath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextMoveToPoint(context, 145, 60);
    CGContextAddRect(context, CGRectMake(145, 60, 30, 90));
    CGContextFillPath(context);
    
    CGContextMoveToPoint(context, 145, 150);
    CGContextAddLineToPoint(context, 160, 130);
    CGContextAddLineToPoint(context, 175, 150);
    CGContextSetBlendMode(context, kCGBlendModeClear);
    CGContextFillPath(context);
    */
    
}



@end



@implementation LayerDelegate

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    UIGraphicsPushContext(ctx);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    [[UIColor blueColor] setFill];
    [path fill];
    UIGraphicsPopContext();
    
}

@end








