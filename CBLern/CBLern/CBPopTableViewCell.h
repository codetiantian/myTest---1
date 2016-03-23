//
//  CBPopTableViewCell.h
//  CBLern
//
//  Created by Elaine on 15--19.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBPopTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;

- (void)setCellItem;

@end
