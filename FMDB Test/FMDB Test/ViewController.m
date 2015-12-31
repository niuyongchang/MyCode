//
//  ViewController.m
//  FMDB Test
//
//  Created by 123 on 15/7/23.
//  Copyright (c) 2015年 北京物网科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()
@property (nonatomic,copy) NSString *dataPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(showData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    _dataPath = [path stringByAppendingPathComponent:@"FMDB.db"];
    FMDatabase *dataBase = [FMDatabase databaseWithPath:[path stringByAppendingPathComponent:@"FMDB.db"]];
    [dataBase open];
    if ([dataBase open]) {
        if (![dataBase tableExists:@"user"]) {
            BOOL creatRes = [dataBase executeUpdate:@"create table user (id integer primary key autoincrement not null,userID long,cartNumber long)"];
            if (!creatRes) {
                
            }
        }else{
            BOOL insertRes = [dataBase executeUpdate:@"insert into user (userID,cartNumber) values (12345634,98865542)"];
            if (!insertRes) {
                
            }
        }
    }
    
}


- (void)showData{
    
    FMDatabase *db = [FMDatabase databaseWithPath:self.dataPath];
    [db open];
    if ([db tableExists:@"user"]) {
        
        FMResultSet *resultSet = [db executeQuery:@"select * from user"];
        while ([resultSet next]) {
            NSLog(@"userID:%ld\ncartNumber:%ld",[resultSet longForColumn:@"userID"],[resultSet longForColumn:@"cartNumber"]);
        }
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
