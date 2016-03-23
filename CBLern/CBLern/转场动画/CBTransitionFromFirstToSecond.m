//
//  CBTransitionFromFirstToSecond.m
//  CBLern
//
//  Created by Elaine on 15--9.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBTransitionFromFirstToSecond.h"
#import "CBTransformCollectionViewCell.h"
#import "CBThing.h"
#import "CBSecondViewController.h"
#import "CBTransformViewController.h"

@implementation CBTransitionFromFirstToSecond

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    CBTransformViewController *fromVC = (CBTransformViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CBSecondViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    CBTransformCollectionViewCell *cell = (CBTransformCollectionViewCell *)[fromVC.myCollectionView cellForItemAtIndexPath:[[fromVC.myCollectionView indexPathsForSelectedItems] firstObject]];
    UIView *cellImageSnapshot = [cell.iconImageView snapshotViewAfterScreenUpdates:NO];
    cellImageSnapshot.frame = [containerView convertRect:cell.iconImageView.frame fromView:cell.iconImageView.superview];
    cell.iconImageView.hidden = YES;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toVC.myImageView.hidden = YES;
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:cellImageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        toVC.view.alpha = 1.0;
        CGRect frame = [containerView convertRect:toVC.myImageView.frame fromView:toVC.view];
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
     
        toVC.myImageView.hidden = NO;
        cell.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

@end
