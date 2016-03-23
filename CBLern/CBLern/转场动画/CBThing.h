//
//  CBThing.h
//  CBLern
//
//  Created by Elaine on 15--9.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CBThing : NSObject

@property (strong, nonatomic) UIImage *image;

/**
 *  初始化
 *
 *  @return 返回图片数组
 */
+ (NSArray *)exampleThings;

- (instancetype)initWithImage:(UIImage *)image;

@end
