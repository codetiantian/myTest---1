//
//  CB_WaterFallLayout.h
//  CBLern
//
//  Created by Elaine on 15--6.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CB_WaterFallLayout;
@protocol CB_WaterFallLayoutDelegate <NSObject>

@required
/**
 *  计算高度
 *
 *  @param waterFlowLayout 约束对象
 *  @param wideth          宽度
 *  @param indexPath       位置
 *
 *  @return 返回高度值
 */
- (CGFloat)waterFlowLayout:(CB_WaterFallLayout *)waterFlowLayout heightForWidth:(CGFloat)wideth indexPath:(NSIndexPath *)indexPath;

@end

@interface CB_WaterFallLayout : UICollectionViewLayout

/**
 *  每一行的间距
 */
@property (assign, nonatomic) CGFloat rowSpace;

/**
 *  列间距
 */
@property (assign, nonatomic) CGFloat columnSpace;

/**
 *  允许的最大列数
 */
@property (assign, nonatomic) CGFloat maxColumnCount;

/**
 *  内边距
 */
@property (assign, nonatomic) UIEdgeInsets itemInsets;

@property (weak, nonatomic) id <CB_WaterFallLayoutDelegate> delegate;

@end
