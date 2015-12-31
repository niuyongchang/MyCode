//
//  CoordinateData.m
//  FiveCheese
//
//  Created by 123 on 15/11/12.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import "CoordinateData.h"

static CoordinateData *data = nil;

@implementation CoordinateData
{
    NSMutableArray *_coordinatesArray;
}

+ (instancetype)data{
    if (data == nil) {
        @synchronized(self) {
            if (data == nil) {
                data = [[self alloc] init];
            }
        }
    }
    return data;
}

- (void)addCoordinate:(CGPoint)coordinate{
    
    if (_coordinatesArray == nil) {
        _coordinatesArray = [NSMutableArray array];
    }
    MyPoint *point = [[MyPoint alloc] init];
    point.x = coordinate.x;
    point.y = coordinate.y;
    point.isEmpty = YES;
    point.chessType = ChessTypeNull;
    [_coordinatesArray addObject:point];
    
}

- (NSMutableArray *)allCoordinate{
    if (_coordinatesArray == nil) {
        _coordinatesArray = [NSMutableArray array];
    }
    return _coordinatesArray;
}

- (MyPoint *)nearestCoordinateOf:(CGPoint)coordinate{
    MyPoint *nearestPoint = nil;
    for (MyPoint *point in _coordinatesArray) {
        if (fabs(point.x - coordinate.x) < 10 && fabs(point.y - coordinate.y) < 10 && point.isEmpty == YES) {
            point.isEmpty = NO;
            point.chessType = [PlayManager manager].chessType;
            nearestPoint = point;
            break;
        }
    }
    return nearestPoint;
}

- (void)restartGame{
    for (MyPoint *point in _coordinatesArray) {
        point.isEmpty = YES;
        point.chessType = ChessTypeNull;
    }
    
}

@end
