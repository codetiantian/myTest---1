//
//  CBTransformViewController.h
//  CBLern
//
//  Created by Elaine on 15--9.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBTransformCollectionViewCell;
@class CBThing;
@interface CBTransformViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
- (CBTransformCollectionViewCell*)collectionViewCellForThing:(CBThing*)thing;

@end
