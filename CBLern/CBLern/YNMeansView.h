//
//  YNMeansView.h
//  CBLern
//
//  Created by Elaine on 15--24.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MeansResultBlock)(CGFloat result);

@interface YNMeansView : UIView <UIScrollViewDelegate>

@property (weak, nonatomic) UIScrollView *meansScrollView;
@property (strong, nonatomic) MeansResultBlock block;

/**
 *  初始化测量
 *
 *  @param min 最小值
 *  @param max 最大值
 */
- (void)initMeansViewWithValueMin:(NSInteger)min withValueMax:(NSInteger)max;

/**
 *  获取当前的值
 */
- (void)getCurrentValue;

@end
