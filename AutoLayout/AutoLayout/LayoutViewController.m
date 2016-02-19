//
//  LayoutViewController.m
//  AutoLayout
//
//  Created by 123 on 15/11/28.
//  Copyright © 2015年 北京物网科技有限公司. All rights reserved.
//

#import "LayoutViewController.h"
#import "ViewController.h"
@interface LayoutViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UILabel *laftLabel;
@property (strong, nonatomic) IBOutlet UILabel *rightLabel;

@end

@implementation LayoutViewController

- (IBAction)loginAction:(id)sender {
    [self.navigationController pushViewController:[ViewController new] animated:YES];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.layer.cornerRadius
    NSString *str = @"哈哈哈哈";
    CGSize size1 = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    CGSize size2 = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:28]}];
    NSLog(@"%@\n%@",NSStringFromCGSize(size1),NSStringFromCGSize(size2));
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)keyboardWillShow:(NSNotification *)noti{
    NSDictionary *dic = noti.userInfo;
    CGRect frame = [dic[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
//    CGRect frame = textField.frame;
//    frame.origin.y += 40;
//    textField.frame = frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
