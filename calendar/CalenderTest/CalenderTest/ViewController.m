//
//  ViewController.m
//  CalenderTest
//
//  Created by 123 on 15/6/19.
//  Copyright (c) 2015年 北京物网科技有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

{
    int _number;
    NSInteger _startTag;
    NSInteger _endTag;
}

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _number = 0;
    [self getData];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/7, 50);
    
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
    
    
    _startTag = 4;
    _endTag = 5;
    
}

- (void)getData{
    _dataSource = [NSMutableArray array];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitWeekday|NSCalendarUnitDay fromDate:[NSDate date]];
    for (int i=0; i<10; i++) {
        NSDate *nowDate = [calendar dateFromComponents:comps];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        format.dateFormat = @"YYYY/MM/dd";
        NSInteger totalNumberOfDays = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:nowDate].length;//当前月总共天数
        NSInteger indexInMonth = [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:nowDate];//当前日期相对当前月的序号
        NSInteger indexInWeek = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:nowDate];
        comps.day -= indexInWeek-1;//日期后退到本周的第一天
        NSMutableArray *subArr = [NSMutableArray array];
        for (int j=1; j <= totalNumberOfDays-indexInMonth+1 + indexInWeek-1; j++) {
            if (j<indexInWeek) {
                [subArr addObject:@""];
            }else{
                NSDate *date = [calendar dateFromComponents:comps];
                NSString *dateStr = [[format stringFromDate:date] substringWithRange:NSMakeRange(5, 5)];
                [subArr addObject:dateStr];
                
            }
            comps.day += 1;
        }
        
        [_dataSource addObject:subArr];
        
    }
    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  _dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *arr = _dataSource[section];
    return arr.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray *arr = _dataSource[indexPath.section];
    UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
    label.tag = 100*indexPath.section+indexPath.item+1;
    label.text = arr[indexPath.item];
    label.numberOfLines = 0;
    label.adjustsFontSizeToFitWidth = YES;
    cell.backgroundView = label;
    if (![label.text isEqualToString:@""]) {
        if (label.tag == _startTag) {
            label.text = [NSString stringWithFormat:@"%@\n入住",label.text];
            label.backgroundColor = [UIColor redColor];
        }else if (label.tag == _endTag){
            label.text = [NSString stringWithFormat:@"%@\n退房",label.text];
            label.backgroundColor = [UIColor redColor];
        }else if (label.tag>_startTag && label.tag < _endTag){
            label.backgroundColor = [UIColor purpleColor];
        }
    }
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UILabel *label = (UILabel *)cell.backgroundView;
    if (![label.text isEqualToString:@""]) {
        if (_startTag && _endTag) {
            _startTag = label.tag;
            _endTag = 0;
        }else if (_startTag){
            if (label.tag>_startTag) {
                _endTag = label.tag;
            }else{
                _startTag = label.tag;
            }
        }
        [collectionView reloadData];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
