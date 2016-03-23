//
//  CBPopTableViewCell.m
//  CBLern
//
//  Created by Elaine on 15--19.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "CBPopTableViewCell.h"

@implementation CBPopTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.mySwitch.on = YES;
    self.mySwitch.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellItem
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.mySwitch.hidden = NO;
    });
}

@end
