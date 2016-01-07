//
//  PieView.m
//  PieView
//
//  Created by 牛永昌 on 16/1/5.
//  Copyright © 2016年 牛永昌. All rights reserved.
//

#import "PieView.h"
#import "BigCirCleLayer.h"
#import "MiddleCircleLayer.h"
#define BigCircleRadius ((self.frame.size.width - 10)/2)

@interface PieView()

@property (nonatomic, strong) BigCirCleLayer *bigCircleLayer;
@property (nonatomic, strong) MiddleCircleLayer *middleLayer;

@end

@implementation PieView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        BigCirCleLayer *baseLayer = [BigCirCleLayer layer];
        baseLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        baseLayer.position = CGPointMake(frame.size.width/2, frame.size.height/2);
        baseLayer.backgroundColor = [UIColor whiteColor].CGColor;
        [self.layer addSublayer:baseLayer];
        [baseLayer setNeedsDisplay];
        _bigCircleLayer = baseLayer;
        
        MiddleCircleLayer *middleLayer = [MiddleCircleLayer layer];
        middleLayer.frame = CGRectMake(0, 0, frame.size.width-40, frame.size.height - 40);
        middleLayer.position = baseLayer.position;
        middleLayer.cornerRadius = middleLayer.frame.size.width/2;
        middleLayer.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.2].CGColor;
        [self.layer addSublayer:middleLayer];
        [middleLayer setNeedsDisplay];
        _middleLayer = middleLayer;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

}


- (void)showAnimation{
    
    [_bigCircleLayer showAnimation];
    [_middleLayer showAnimation];
    
}

@end
