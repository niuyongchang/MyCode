//
//  ChessBoardView.h
//  FiveCheese
//
//  Created by 123 on 15/11/12.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChessView.h"

@interface ChessBoardView : UIView



- (void)addChessIn:(CGPoint)point;

- (void)restartGame;

@end
