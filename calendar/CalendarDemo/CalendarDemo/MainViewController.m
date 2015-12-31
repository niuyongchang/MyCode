//
//  MainViewController.m
//  CalendarDemo
//
//  Created by mac on 15/6/19.
//

#import "MainViewController.h"

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//屏幕比例
#define ratio SCREEN_WIDTH/320

@implementation MainViewController{
    UIScrollView *_bigScr;
    NSArray *_weekArr;
    NSMutableArray *_dataSource;
    
    NSString *_inDate;//入住
    NSString *_outDate;//退房
    NSInteger _tag1;
    NSInteger _tag2;
    
    NSMutableArray *_dateArray;//入住期间日期
}

-(void)viewDidLoad{
    self.view.backgroundColor=[[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    
    CGRect frame=[self getWeekView];
    _bigScr=[[UIScrollView alloc]init];
    _bigScr.frame=CGRectMake(frame.origin.x, frame.origin.y+frame.size.height, frame.size.width, SCREEN_HEIGHT-(frame.origin.y+frame.size.height));
    [self.view addSubview:_bigScr];
                             
    
    _dataSource=[self getweekTimeWithDate:[NSDate date]];
    _inDate=[[_dataSource objectAtIndex:0] objectAtIndex:0];
    if([[_dataSource objectAtIndex:0] count]>=2){
        _outDate=[[_dataSource objectAtIndex:0] objectAtIndex:1];
    }else{
        _outDate=[[_dataSource objectAtIndex:1] objectAtIndex:0];
    }
//    NSLog(@"_inDate=%@  _outDate=%@",_inDate,_outDate);
    
    frame=CGRectMake(0, 0, 0, 0);
    for(int i=0;i<_dataSource.count;i++){
        frame=[self getMonthViewWithArray:i andHeight:frame.size.height+frame.origin.y];
    }
    _bigScr.contentSize=CGSizeMake(0, frame.origin.y+frame.size.height);
    
    _dateArray=[self reloadAllBtn];
}

-(CGRect)getWeekView{
    UIView *weekView=[[UIView alloc]init];
    weekView.frame=CGRectMake(0, 64, SCREEN_WIDTH, 20*ratio);
    [self.view addSubview:weekView];
    
    _weekArr=[NSArray arrayWithObjects:@"一",@"二",@"三",@"四",@"五",@"六",@"日", nil];
    for(int i=0;i<7;i++){
        UILabel *lab=[[UILabel alloc]init];
        lab.frame=CGRectMake(SCREEN_WIDTH/7*i, 0, SCREEN_WIDTH/7, weekView.frame.size.height);
        lab.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:0.5];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.text=[_weekArr objectAtIndex:i];
        [weekView addSubview:lab];
    }
    return weekView.frame;
}



-(CGRect)getMonthViewWithArray:(int)section andHeight:(NSInteger)oriangeHeight{
    NSArray *array=[_dataSource objectAtIndex:section];
    
    UIView *v=[[UIView alloc]init];
    v.backgroundColor=[UIColor whiteColor];

    
    UILabel *lab=[[UILabel alloc]init];
    lab.frame=CGRectMake(0, 0.5, SCREEN_WIDTH, 40*ratio);
    lab.text=[[array objectAtIndex:0] substringToIndex:8];
    lab.textAlignment=NSTextAlignmentCenter;
    lab.backgroundColor=[UIColor whiteColor];
    [v addSubview:lab];
    
    CGRect lineRect=CGRectMake(0, 0, SCREEN_WIDTH, 0.5);
    [self addLineWithRect:lineRect andSuperView:v];
    
    lineRect=CGRectMake(0, lab.frame.size.height+lab.frame.origin.y, SCREEN_WIDTH, 0.5);
    [self addLineWithRect:lineRect andSuperView:v];
    
    
    
    float row=0;
    float rowHeight=55*ratio;
    float rowWidth=SCREEN_WIDTH/7;
    for(int i=0;i<array.count;i++){
        NSString *str=[array objectAtIndex:i];
        NSString *weekStr=[str substringFromIndex:str.length-1];
        /*
         从当天起
         n 一周的第几天  UI上第几列    row 一月的第几周 UI上第几行
         */
        NSInteger n=[_weekArr indexOfObject:weekStr];
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(n*rowWidth, row*rowHeight+lab.frame.size.height+lab.frame.origin.y, rowWidth, rowHeight);
        NSString *title=[NSString stringWithFormat:@"%@\n",[[array objectAtIndex:i]substringWithRange:NSMakeRange(8, 2)]];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.numberOfLines=0;
        btn.titleLabel.textAlignment=NSTextAlignmentCenter;
        btn.titleLabel.font=[UIFont boldSystemFontOfSize:13*ratio];
        btn.backgroundColor=[UIColor whiteColor];
        btn.layer.borderColor=[[UIColor lightGrayColor] colorWithAlphaComponent:0.3].CGColor;
        btn.layer.borderWidth=0.5;
        btn.tag=section*1000+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [v addSubview:btn];
        
        if (n==_weekArr.count-1) {
            row+=1;
        }
        
        if (i==array.count-1) {
            NSInteger totalHeight=btn.frame.origin.y+btn.frame.size.height;
            v.frame = CGRectMake(0, oriangeHeight, SCREEN_WIDTH, totalHeight);
        }
    }
    
    
    
    [_bigScr addSubview:v];
    return v.frame;
}

-(void)btnClick:(UIButton *)btn{
    NSInteger sec=btn.tag/1000;
    NSInteger row=btn.tag-sec*1000;
    NSString *title1=[[_dataSource objectAtIndex:sec] objectAtIndex:row];
    
    
    if ([_outDate length]) {
        _inDate=title1;
        _outDate=@"";
        _tag2=_tag1=btn.tag;
    }else if([title1 compare:_inDate]==-1){
        _inDate=title1;
        _outDate=@"";
        _tag2=_tag1=btn.tag;
    }else{
        _outDate=title1;
        _tag2=btn.tag;
    }
    
    _dateArray=[self reloadAllBtn];
    
}

-(NSMutableArray *)reloadAllBtn{
    
    NSMutableArray *dateArray=[NSMutableArray array];
    
    
    for(int i=0;i<_dataSource.count;i++){
        
        UIView *monthView=[_bigScr.subviews objectAtIndex:i];
        for (UIView *btnView in monthView.subviews) {
            
            if ([btnView isKindOfClass:[UIButton class]]) {
                
                UIButton *subBtn=(UIButton *)btnView;
                NSInteger sec=subBtn.tag/1000;
                NSInteger row=subBtn.tag-sec*1000;
                NSString *title1=[[_dataSource objectAtIndex:sec] objectAtIndex:row];
                
                NSString *title2=[NSString stringWithFormat:@"%@\n",[title1 substringWithRange:NSMakeRange(8, 2)]];
                subBtn.backgroundColor=[UIColor redColor];
                [subBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                if ([title1 isEqualToString:_inDate]) {
                    title2=[NSString stringWithFormat:@"%@\n入住",[title1 substringWithRange:NSMakeRange(8, 2)]];
                    [dateArray addObject:title1];
                }else if ([title1 isEqualToString:_outDate]){
                    title2=[NSString stringWithFormat:@"%@\n退房",[title1 substringWithRange:NSMakeRange(8, 2)]];
                    [dateArray addObject:title1];
                }else{
                    if (subBtn.tag>_tag1&&subBtn.tag<_tag2) {
                        subBtn.backgroundColor=[[UIColor redColor] colorWithAlphaComponent:0.5];
                        [subBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                        [dateArray addObject:title1];
                    }else{
                        subBtn.backgroundColor=[UIColor whiteColor];
                        [subBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    }
                }
                [subBtn setTitle:title2 forState:UIControlStateNormal];
            }
        }
    }
    return dateArray;
}

-(void)addLineWithRect:(CGRect)frame andSuperView:(UIView *)v{
    UIView *line1=[[UIView alloc]init];
    line1.frame=frame;
    line1.backgroundColor=[[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [v addSubview:line1];
}







#pragma - mark - 获取数据源
-(NSMutableArray *)getweekTimeWithDate:(NSDate *)date{
    NSArray * arrWeek=[NSArray arrayWithObjects:@"日",@"一",@"二",@"三",@"四",@"五",@"六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour ;
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    
    
    comps.month+=3;
    comps.day+=1;
    NSDate *clickedDate = [calendar dateFromComponents:comps];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY年MM月dd"];
    NSString *lastStr=[formatter stringFromDate:clickedDate];
    comps.month-=3;
    comps.day-=1;
    
    
    NSMutableArray *dateArr=[NSMutableArray array];
    
    NSMutableArray *subArr=[NSMutableArray array];
    
    [subArr addObject:[NSString stringWithFormat:@"%.4ld年%.2ld月%.2ld %@",[comps year],[comps month],[comps day],[arrWeek objectAtIndex:week-1]]];
    
    for(int i=1;i<100;i++){
        comps.day+=1;
        
        NSDate *clickedDate = [calendar dateFromComponents:comps];
        NSString *str=[formatter stringFromDate:clickedDate];
        
        
//        NSLog(@"===%@",str);
        
        
        NSString *value=[NSString stringWithFormat:@"%@ %@",str,[self changetoStrWithDate:clickedDate]];
        if ([[str substringWithRange:NSMakeRange(5, 2)]isEqualToString:[[subArr objectAtIndex:0] substringWithRange:NSMakeRange(5, 2)]]) {
            [subArr addObject:value];
        }else{
            [dateArr addObject:subArr];
            subArr=[NSMutableArray array];
            [subArr addObject:value];
        }
        
        if ([str isEqualToString:lastStr]) {
            [dateArr addObject:subArr];
            break;
        }
        
    }
    
    
    return  dateArr;
}
-(NSString *)changetoStrWithDate:(NSDate *)date{
    NSArray * arrWeek=[NSArray arrayWithObjects:@"日",@"一",@"二",@"三",@"四",@"五",@"六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour ;
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    return [arrWeek objectAtIndex:week-1];
}



@end
