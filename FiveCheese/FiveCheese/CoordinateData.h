//
//  CoordinateData.h
//  FiveCheese
//
//  Created by 123 on 15/11/12.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Header.h"
#import "PlayManager.h"

@interface MyPoint : NSObject

@property (nonatomic, assign) double x;
@property (nonatomic, assign) double y;
@property (nonatomic, assign) BOOL isEmpty;//isEmpty = YES 说明该点还没有棋子
@property (nonatomic, assign) ChessType chessType;
//@property (nonatomic, assign) BOOL isUseful;//YES 说明可能是五连珠中的一个

@end


@interface CoordinateData : NSObject


+ (instancetype)data;

- (void)addCoordinate:(CGPoint)coordinate;

- (NSMutableArray *)allCoordinate;

//返回距离给定坐标最近的点
- (MyPoint *)nearestCoordinateOf:(CGPoint)coordinate;

- (void)restartGame;

@end
