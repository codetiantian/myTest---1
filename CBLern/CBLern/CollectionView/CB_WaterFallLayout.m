//
//  CB_WaterFallLayout.m
//  CBLern
//
//  Created by Elaine on 15--6.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CB_WaterFallLayout.h"

@interface CB_WaterFallLayout ()

@property (strong, nonatomic) NSMutableDictionary *dictMaxY;

//  存放布局属性
@property (strong, nonatomic) NSMutableArray *arrayAttrs;

@end

@implementation CB_WaterFallLayout

- (instancetype)init
{
    if ([super init]) {
        self.columnSpace = 10;
        self.rowSpace = 10;
        self.itemInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        self.maxColumnCount = 2;
    }
    return self;
}

- (NSMutableDictionary *)dictMaxY
{
    if (!_dictMaxY) {
        _dictMaxY = [NSMutableDictionary dictionary];
        for (NSInteger i = 0; i < self.maxColumnCount; i++) {
            NSString *strColumn = [NSString stringWithFormat:@"%li", (long)i];
            _dictMaxY[strColumn] = @"0";
        }
    }
    
    return _dictMaxY;
}

- (NSMutableArray *)arrayAttrs
{
    if (!_arrayAttrs) {
        _arrayAttrs = [NSMutableArray array];
    }
    return _arrayAttrs;
}

#pragma mark - 以下方法每次滑动都会重新调用
- (void)prepareLayout
{
    for (NSInteger i = 0; i < self.maxColumnCount; i++) {
        NSString *strColumn = [NSString stringWithFormat:@"%li", i];
        self.dictMaxY[strColumn] = @(self.itemInsets.top);
    }
    
    [self.arrayAttrs removeAllObjects];
    
    //  1.查看有多少个item
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    //  2.遍历每个item属性
    for (NSInteger i = 0; i < itemCount; i++) {
        //  3.取出布局属性
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        //  4.添加到数组中
        [self.arrayAttrs addObject:attr];
    }
}

//  设置允许每个collectionView的content的宽、高
//  该方法会被调用两次 prepareLayout方法后调用一次  layoutAttributesForElementsInRect:方法后会再调用一次
- (CGSize)collectionViewContentSize
{
    __block NSString *maxColumn = @"0";
    [self.dictMaxY enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj floatValue] > [self.dictMaxY[maxColumn] floatValue]) {
            maxColumn = key;
        }
    }];
    
    return CGSizeMake(0, [self.dictMaxY[maxColumn] floatValue] + self.itemInsets.bottom);
}

//  允许重新查找集合视图的布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/**
 *  实现布局
 *
 *  @param indexPath 指定的位置
 *
 *  @return 返回layout attributes 的实例
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    __block NSString *minColumn = @"0";
    [self.dictMaxY enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj floatValue] < [self.dictMaxY[minColumn] floatValue]) {
            minColumn = key;
        }
    }];
    
    //  计算frame
    CGFloat width = (CGRectGetWidth(self.collectionView.frame) - self.itemInsets.left - self.itemInsets.right - self.columnSpace * (self.maxColumnCount - 1)) / self.maxColumnCount;
    CGFloat height = [self.delegate waterFlowLayout:self heightForWidth:width indexPath:indexPath];
    CGFloat x = self.itemInsets.left + (width + self.columnSpace) * [minColumn integerValue];
    CGFloat y = [self.dictMaxY[minColumn] floatValue] + self.rowSpace;
    self.dictMaxY[minColumn] = @(height + y);
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(x, y, width, height);
    
    return attrs;
}

//  设置每个Cell的大小及位置
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.arrayAttrs;
}

@end
