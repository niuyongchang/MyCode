//
//  ViewController.m
//  FiveCheese
//
//  Created by 123 on 15/11/12.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "ChessBoardView.h"
#import "CoordinateData.h"
#import "PlayManager.h"

@interface ViewController ()

@property (nonatomic, strong) ChessBoardView *chessBoardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ChessBoardView *chessBoard = [[ChessBoardView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - self.view.frame.size.width)/2, self.view.frame.size.width, self.view.frame.size.width)];
    self.chessBoardView = chessBoard;
    [self.view addSubview:chessBoard];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [chessBoard addGestureRecognizer:tap];
    
    
    UIButton *restart = [UIButton buttonWithType:UIButtonTypeSystem];
    restart.frame = CGRectMake(self.view.frame.size.width/2-40, self.view.frame.size.height-120, 80, 60);
    restart.backgroundColor = [UIColor redColor];
    [restart setTitle:@"Restart" forState:UIControlStateNormal];
    [restart addTarget:self action:@selector(restartGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:restart];
    
}

- (void)handleTap:(UITapGestureRecognizer *)tap{
    
    ChessBoardView *boardView = (id)tap.view;
    
    CGPoint point = [tap locationInView:boardView];
    
    MyPoint *chessPoint = [[CoordinateData data] nearestCoordinateOf:point];
    
    if (chessPoint != nil) {//正确数据
        [boardView addChessIn:CGPointMake(chessPoint.x, chessPoint.y)];
        
        BOOL isWin = [[PlayManager manager] winnerByPoint:chessPoint];
        
        [PlayManager manager].chessType = ![PlayManager manager].chessType;
        
        if (isWin) {
            UIAlertController *aler = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"%@ win !",chessPoint.chessType == ChessTypeWhite?@"white":@"black"] preferredStyle:UIAlertControllerStyleAlert];
            [aler addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self restartGame];
                [aler dismissViewControllerAnimated:YES completion:nil];
            }]];
            [self presentViewController:aler animated:YES completion:nil];
        }
        
    }
    
}

- (void)restartGame{
    
    [self.chessBoardView restartGame];
    [[CoordinateData data] restartGame];
    [PlayManager manager].chessType = ChessTypeWhite;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
