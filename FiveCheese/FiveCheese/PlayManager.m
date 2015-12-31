//
//  PlayManager.m
//  FiveCheese
//
//  Created by 123 on 15/11/12.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import "PlayManager.h"


static PlayManager *manager = nil;
@implementation PlayManager

+ (instancetype)manager{
    if (manager == nil) {
        @synchronized(self) {
            if (manager == nil) {
                manager = [[self alloc] init];
                manager.chessType = ChessTypeWhite;
            }
        }
    }
    return manager;
}


- (BOOL)winnerByPoint:(MyPoint *)point{
    
    NSArray *coordinateArr = [[CoordinateData data] allCoordinate];
    
    NSMutableArray *pointsOfUsed = [NSMutableArray array];
    
    //把所有跟当前颜色一致的点取出来
    for (MyPoint *p in coordinateArr) {
        if (p.isEmpty == NO && p.chessType == point.chessType) {
            [pointsOfUsed addObject:p];
        }
    }
    
    return [self horizontalFinish:pointsOfUsed by:point.y] ||
           [self verticalFinish:pointsOfUsed by:point.x] ||
           [self obliqueToTopFinish:pointsOfUsed by:point] ||
           [self obliqueToBottomFinish:pointsOfUsed by:point];
}
//横向判断
- (BOOL)horizontalFinish:(NSArray *)points by:(double)y{
    //把y坐标一样的取出来
    NSMutableArray *arr = [NSMutableArray array];
    for (MyPoint *p in points) {
        if (p.y == y) {
            [arr addObject:p];
        }
    }
    //由小到大排序
    [arr sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        MyPoint *p1 = obj1;
        MyPoint *p2 = obj2;
        if (p1.x>p2.x) {
            return NSOrderedDescending;
        }else if (p1.x<p2.x){
            return NSOrderedAscending;
        }else{
            return NSOrderedSame;
        }
    }];
    
    return [self judgeByX:arr];
    
}
//纵向判断
- (BOOL)verticalFinish:(NSArray *)points by:(double)x{
    //把x坐标一样的取出来
    NSMutableArray *arr = [NSMutableArray array];
    for (MyPoint *p in points) {
        if (p.x == x) {
            [arr addObject:p];
        }
    }
    //由小到大排序
    [arr sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        MyPoint *p1 = obj1;
        MyPoint *p2 = obj2;
        if (p1.y>p2.y) {
            return NSOrderedDescending;
        }else if (p1.y<p2.y){
            return NSOrderedAscending;
        }else{
            return NSOrderedSame;
        }
    }];
    
    return [self judgeByY:arr];
}
//斜向上判断
- (BOOL)obliqueToTopFinish:(NSArray *)points by:(MyPoint *)point{
    //把位于一条斜线的点取出来:与给定点 x的差值(绝对值)等于y的差值(绝对值)，且符号相反
    NSMutableArray *arr = [NSMutableArray array];
    for (MyPoint *p in points) {
        if (fabs(p.x - point.x) == fabs(p.y - point.y) &&
            ((p.x - point.x) == (-(p.y - point.y)))) {
            [arr addObject:p];
        }
    }
    //由小到大排序
    [arr sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        MyPoint *p1 = obj1;
        MyPoint *p2 = obj2;
        if (p1.x>p2.x) {
            return NSOrderedDescending;
        }else if (p1.x<p2.x){
            return NSOrderedAscending;
        }else{
            return NSOrderedSame;
        }
    }];
    
    return [self judgeByX:arr];
}

//斜向下判断
- (BOOL)obliqueToBottomFinish:(NSArray *)points by:(MyPoint *)point{
    //把位于一条斜线的点取出来:与给定点 x的差值(绝对值)等于y的差值(绝对值)，且符号相同
    NSMutableArray *arr = [NSMutableArray array];
    for (MyPoint *p in points) {
        if (fabs(p.x - point.x) == fabs(p.y - point.y) &&
            ((p.x - point.x) == (p.y - point.y))) {
            [arr addObject:p];
        }
    }
    //由小到大排序
    [arr sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        MyPoint *p1 = obj1;
        MyPoint *p2 = obj2;
        if (p1.y>p2.y) {
            return NSOrderedDescending;
        }else if (p1.y<p2.y){
            return NSOrderedAscending;
        }else{
            return NSOrderedSame;
        }
    }];
    
    return [self judgeByY:arr];
}

- (BOOL)judgeByX:(NSMutableArray *)arr{
    if (arr.count >= 5) {//大于五个进行下一步判断：间隔是否都是30
        if (arr.count == 5) {
            MyPoint *p1 = arr[0];
            MyPoint *p2 = arr[4];
            return p2.x - p1.x == 4*basicHeight;
            
        }else{
            int usefulNum = 1;
            for (int i = 0; i < arr.count-1; i++) {
                MyPoint *p1 = arr[i];
                MyPoint *p2 = arr[i+1];
                if (p2.x - p1.x == basicHeight) {
                    usefulNum += 1 ;
                }else{
                    usefulNum = 1;
                }
                
                if (usefulNum == 5) {
                    return YES;
                }
            }
        }
    }
    return NO;
}

- (BOOL)judgeByY:(NSMutableArray *)arr{
    if (arr.count >= 5) {//大于五个进行下一步判断：间隔是否都是30
        if (arr.count == 5) {
            MyPoint *p1 = arr[0];
            MyPoint *p2 = arr[4];
            return p2.y - p1.y == 4*basicHeight;
            
        }else{
            int usefulNum = 1;
            for (int i = 0; i < arr.count-1; i++) {
                MyPoint *p1 = arr[i];
                MyPoint *p2 = arr[i+1];
                if (p2.y - p1.y == basicHeight) {
                    usefulNum += 1 ;
                }else{
                    usefulNum = 1;
                }
                
                if (usefulNum == 5) {
                    return YES;
                }
            }
        }
    }
    return NO;
}


@end
