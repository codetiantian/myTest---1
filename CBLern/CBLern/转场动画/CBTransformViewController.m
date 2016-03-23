//
//  CBTransformViewController.m
//  CBLern
//
//  Created by Elaine on 15--9.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBTransformViewController.h"
#import "CBTransformCollectionViewCell.h"
#import "CBThing.h"
#import "CBSecondViewController.h"
#import "CBTransitionFromFirstToSecond.h"

@interface CBTransformViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate>


@property (nonatomic, strong) NSArray *things;

@end

@implementation CBTransformViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self != nil) {
        self.things = [CBThing exampleThings];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myCollectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[CBSecondViewController class]]) {
        NSIndexPath *selectedIndexPath = [[self.myCollectionView indexPathsForSelectedItems] firstObject];
        
        if (selectedIndexPath != nil) {
            CBSecondViewController *secondVC = segue.destinationViewController;
            secondVC.thing = self.things[selectedIndexPath.row];
        }
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (fromVC == self && [toVC isKindOfClass:[CBSecondViewController class]]) {
        return [[CBTransitionFromFirstToSecond alloc] init];
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.things.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CBTransformCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CBCollectionCellIndex" forIndexPath:indexPath];
    CBThing *thing = self.things[indexPath.row];
    cell.iconImageView.image = thing.image;
    
    return cell;
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
//    
//}

- (CBTransformCollectionViewCell *)collectionViewCellForThing:(CBThing *)thing
{
    NSUInteger thingIndex = [self.things indexOfObject:thing];
    
    if (thingIndex == NSNotFound) {
        return nil;
    }
    
    return (CBTransformCollectionViewCell *)[self.myCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:thingIndex inSection:0]];
}

@end
