//
//  NSData+DataToHexString.m
//  CBLern
//
//  Created by Elaine on 15--12.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "NSData+DataToHexString.h"

@implementation NSData (DataToHexString)

- (NSString *) dataToHexString
{
    NSUInteger          len = [self length];
    char *              chars = (char *)[self bytes];
    NSMutableString *   hexString = [[NSMutableString alloc] init];
    
    for(NSUInteger i = 0; i < len; i++ )
        [hexString appendString:[NSString stringWithFormat:@"%0.2hhx", chars[i]]];
    
    return hexString;
}

@end
