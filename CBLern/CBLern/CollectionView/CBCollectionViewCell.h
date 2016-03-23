//
//  CBCollectionViewCell.h
//  CBLern
//
//  Created by Elaine on 15--6.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

- (void)setCellItemWithName:(NSString *)strName;

@end
