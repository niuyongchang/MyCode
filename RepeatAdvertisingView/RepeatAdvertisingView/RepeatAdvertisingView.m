//
//  RepeatAdvertisingView.m
//  RepeatAdvertisingView
//
//  Created by 牛永昌 on 15/12/29.
//  Copyright © 2015年 牛永昌. All rights reserved.
//

#import "RepeatAdvertisingView.h"

@interface RepeatAdvertisingView ()
@property (nonatomic, assign) NSInteger visibleImageIndex;//当前可见图片的序号
@property (nonatomic, strong) NSArray *imagesArray;

@end

@implementation RepeatAdvertisingView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIScrollView *scrView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        scrView.contentSize = CGSizeMake(frame.size.width*3, 0);
        scrView.pagingEnabled = YES;
        scrView.delegate = self;
        scrView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:scrView];
        
        NSArray *imageNameArray = @[@"image_01.jpg",@"image_02.jpg",@"image_03.jpg",@"image_04.jpg"];
        _imagesArray = imageNameArray;
        for (int i = 0; i < 3 ; i++) {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*frame.size.width, 0, frame.size.width, frame.size.height)];
            if (i == 0) {
                imgView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageNameArray lastObject] ofType:nil]];
            }else{
                imgView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageNameArray[i-1] ofType:nil]];
                
            }
            [scrView addSubview:imgView];
        }
        _visibleImageIndex = 0;
        scrView.contentOffset = CGPointMake(frame.size.width, 0);
        
    }
    return self;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSArray *arr = scrollView.subviews;
    UIImageView *leftImageView = arr[0];
    UIImageView *centerImageView = arr[1];
    UIImageView *rightImageView = arr[2];
    if (scrollView.contentOffset.x > self.frame.size.width) {
        //向左滑了,index要变大
        _visibleImageIndex ++;
        _visibleImageIndex = _visibleImageIndex > self.imagesArray.count - 1?0:_visibleImageIndex;
        
    }else{
        //向右滑了,index要变小
        _visibleImageIndex --;
        _visibleImageIndex = _visibleImageIndex<0?self.imagesArray.count - 1:_visibleImageIndex;
        
    }
    leftImageView.image = [self imageByIndex:_visibleImageIndex-1<0?self.imagesArray.count-1:_visibleImageIndex-1];
    centerImageView.image = [self imageByIndex:_visibleImageIndex];
    rightImageView.image = [self imageByIndex:_visibleImageIndex+1>self.imagesArray.count-1?0:_visibleImageIndex+1];
    scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
    
}

- (UIImage *)imageByIndex:(NSInteger)index{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_imagesArray[index] ofType:nil]];
}


@end
