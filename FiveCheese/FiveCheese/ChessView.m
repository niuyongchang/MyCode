//
//  ChessView.m
//  FiveCheese
//
//  Created by 123 on 15/11/12.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import "ChessView.h"

@implementation ChessView

- (id)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        
        self.layer.cornerRadius = self.frame.size.width/2;
        
        
    }
    return self;
}

- (void)setColor:(UIColor *)color{
    _color = color;
    self.backgroundColor = color;
}


@end
