//
//  CBCollectionViewController.m
//  CBLern
//
//  Created by Elaine on 15--6.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBCollectionViewController.h"
#import "CBCollectionViewCell.h"
#import "CB_WaterFallLayout.h"

#define mainSize [UIScreen mainScreen].bounds.size

@interface CBCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CB_WaterFallLayoutDelegate>

@property (strong, nonatomic) NSMutableArray *arrayData;

@end

@implementation CBCollectionViewController

static NSString * const reuseIdentifier = @"IndexCell";

- (NSMutableArray *)arrayData
{
    if (!_arrayData) {
        _arrayData = [NSMutableArray arrayWithObjects:@"80", @"160", @"60", @"150", @"150", @"220", @"90", @"250", nil];
    }
    return _arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试";
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[CBCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    CB_WaterFallLayout *waterFlow = [[CB_WaterFallLayout alloc] init];
    waterFlow.delegate = self;
    [self.collectionView setCollectionViewLayout:waterFlow];
    
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    // Do any additional setup after loading the view.
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

- (CGFloat)waterFlowLayout:(CB_WaterFallLayout *)waterFlowLayout heightForWidth:(CGFloat)wideth indexPath:(NSIndexPath *)indexPath
{
    return [self.arrayData[indexPath.row] floatValue];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayData.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(mainSize.width, 20);
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 20;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10;
//}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake((mainSize.width - 15 * 3) / 2, [self.arrayData[indexPath.row] integerValue]);
//}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CBCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    [cell setCellItemWithName:[NSString stringWithFormat:@"%li", indexPath.row]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
