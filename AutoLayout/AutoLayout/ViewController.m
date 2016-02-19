//
//  ViewController.m
//  AutoLayout
//
//  Created by 123 on 15/5/4.
//  Copyright (c) 2015年 北京物网科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeDirection:) name:UIDeviceOrientationDidChangeNotification object:nil];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = @"薆ugh挨饿如何调阿尔卡";
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 110;
    [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)changeDirection:(NSNotification *)noti{
    
    self.tableView.frame = self.view.bounds;
//    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *identifier = <#identifier#>;
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];

    return cell;
}

#pragma mark - UITableDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell changeTitle:@"今天是个好日子" subTitle:@"我捡到了100万" money:@"10,000,000"];
    
}

@end
