//
//  PlayManager.h
//  FiveCheese
//
//  Created by 123 on 15/11/12.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CoordinateData.h"
#import "Header.h"

@interface PlayManager : NSObject

@property (nonatomic, assign) ChessType chessType;


+ (instancetype)manager;

- (BOOL)winnerByPoint:(id)point;

@end
