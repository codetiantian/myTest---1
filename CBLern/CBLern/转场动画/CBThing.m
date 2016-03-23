//
//  CBThing.m
//  CBLern
//
//  Created by Elaine on 15--9.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import "CBThing.h"

@implementation CBThing
- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self != nil) {
        _image = image;
    }
    return self;
}

+ (NSArray *)exampleThings
{
    return @[[[CBThing alloc] initWithImage:[UIImage imageNamed:@"thing01.jpg"]], [[CBThing alloc] initWithImage:[UIImage imageNamed:@"thing02.jpg"]], [[CBThing alloc] initWithImage:[UIImage imageNamed:@"thing03.jpg"]], [[CBThing alloc] initWithImage:[UIImage imageNamed:@"thing04.jpg"]], [[CBThing alloc] initWithImage:[UIImage imageNamed:@"thing05.jpg"]]];
}

@end
