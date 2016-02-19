//
//  TableViewCell.m
//  AutoLayout
//
//  Created by 123 on 15/5/5.
//  Copyright (c) 2015年 北京物网科技有限公司. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *moneyLabel;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)changeTitle:(NSString *)title subTitle:(NSString *)subTitle money:(NSString *)money{
    _titleLabel.text = title;
    _subTitleLabel.text = subTitle;
    _moneyLabel.text = money;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
