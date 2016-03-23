//
//  YNMeansView.m
//  CBLern
//
//  Created by Elaine on 15--24.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "YNMeansView.h"

#define meansNum 50

@implementation YNMeansView

- (void)initMeansViewWithValueMin:(NSInteger)min withValueMax:(NSInteger)max
{
    [self initMeansScrollViewWithValueMin:min withValueMax:max];
    [self initImageViewWithNumWithValueMin:min withValueMax:max];
    [self initLineView];
}

- (void)initMeansScrollViewWithValueMin:(NSInteger)min withValueMax:(NSInteger)max
{
    NSInteger num = (max - min) / 10;
    UIScrollView *meansScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    meansScrollView.contentInset = UIEdgeInsetsMake(0, self.frame.size.width / 2, 0, self.frame.size.width / 2);
    meansScrollView.contentSize = CGSizeMake(num * meansNum, 0);
    meansScrollView.contentOffset = CGPointMake(0, 0);
    meansScrollView.showsHorizontalScrollIndicator = NO;
    meansScrollView.showsVerticalScrollIndicator = NO;
    meansScrollView.bounces = NO;
    meansScrollView.delegate = self;
    self.meansScrollView = meansScrollView;
    
    [self addSubview:self.meansScrollView];
}

- (void)initImageViewWithNumWithValueMin:(NSInteger)min withValueMax:(NSInteger)max
{
    NSInteger num = (max - min) / 10;
    int i = 0;
    for (; i < num; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * meansNum, 0, meansNum, self.frame.size.height * 0.6)];
        
        imageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        for (int j = 0; j < 10; j ++) {
            
            CGFloat lineImageViewH = self.frame.size.height * 0.3;
            if (j == 0 || j == 5) {
                lineImageViewH = self.frame.size.height * 0.3 + 10;
            }
            
            CGFloat wide = (meansNum - 10) / 10;
            
            UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(j * (wide + 1), 0, 1, lineImageViewH)];
            lineImageView.backgroundColor = [UIColor blackColor];
            [imageView addSubview:lineImageView];
        }
        
        UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x - meansNum / 2 , imageView.frame.size.height + 5, meansNum, 13)];
        numLabel.font = [UIFont systemFontOfSize:13];
        numLabel.textColor = [UIColor blackColor];
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.text = [NSString stringWithFormat:@"%i", min + i * 10];
        
        [self.meansScrollView addSubview:imageView];
        [self.meansScrollView addSubview:numLabel];
    }
    
    if (i == num) {
        UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * meansNum - meansNum / 2 , self.frame.size.height * 0.6 + 5, meansNum, 13)];
        numLabel.font = [UIFont systemFontOfSize:13];
        numLabel.textColor = [UIColor blackColor];
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.text = [NSString stringWithFormat:@"%i", max];
        
        UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * meansNum, 0, 1, self.frame.size.height * 0.3 + 10)];
        lineImageView.backgroundColor = [UIColor blackColor];
        [self.meansScrollView addSubview:lineImageView];
        
        [self.meansScrollView addSubview:numLabel];
    }
}

- (void)initLineView
{
    CGFloat lineX = (self.frame.size.width - 1) / 2;
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(lineX, 0, 1, self.frame.size.height * 0.6 + 3)];
    lineView.backgroundColor = [UIColor greenColor];
    [self addSubview:lineView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self sendResult];
}

- (void)sendResult
{
    CGFloat moveX = self.frame.size.width / 2;
    
    if (self.block) {
        self.block((self.meansScrollView.contentOffset.x + moveX) / 5.0 + 30);
    }
}

- (void)getCurrentValue
{
    [self sendResult];
}

@end
