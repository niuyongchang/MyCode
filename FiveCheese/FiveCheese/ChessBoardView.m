//
//  ChessBoardView.m
//  FiveCheese
//
//  Created by 123 on 15/11/12.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import "ChessBoardView.h"
#import "CoordinateData.h"
#import "PlayManager.h"


@implementation ChessBoardView

- (id)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        [self configureChessBoard];
    }
    return self;
}

- (void)configureChessBoard{
    
    CGSize size = self.frame.size;
    CGFloat pad;
    int columnNum;
    columnNum = size.width / basicHeight;
    if ((int)size.width % basicHeight != 0) {//
        int temp = (int)size.width % basicHeight;//余数
        pad = temp / 2;
        
    }else{
        pad = 0;
    }
    
    for (int i = 0; i <= columnNum; i++) {
        
        UIView *rowLine = [[UIView alloc] initWithFrame:CGRectMake(pad , pad + basicHeight * i, size.width - 2 * pad, 1)];
        rowLine.backgroundColor = [UIColor redColor];
        [self addSubview:rowLine];
        
        UIView *columnLine = [[UIView alloc] initWithFrame:CGRectMake(pad + basicHeight * i, pad, 1, size.width - 2 * pad)];
        columnLine.backgroundColor = [UIColor greenColor];
        [self addSubview:columnLine];
        
        //记录交点信息
        
        for (int j = 0; j <= i; j++) {
            CGPoint point1 = CGPointMake(pad + basicHeight * j, pad + basicHeight * (i - j));
            
            [[CoordinateData data] addCoordinate:point1];
            
            CGPoint point2 = CGPointMake(pad + basicHeight * (columnNum - j), pad + basicHeight * (columnNum - (i - j)));
            if (i != columnNum) {
                
                [[CoordinateData data] addCoordinate:point2];
            }
            
        }
        
    }
    
}

- (void)addChessIn:(CGPoint)point{
    ChessView *chess = [[ChessView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    chess.center = point;
    chess.color = [PlayManager manager].chessType == ChessTypeWhite?[UIColor whiteColor]:[UIColor blackColor];
    [self addSubview:chess];
}

- (void)restartGame{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[ChessView class]]) {
            [subView removeFromSuperview];
        }
    }
}

@end

@implementation MyPoint


@end
