//
//  NSNull+MyNull.m
//  CBLern
//
//  Created by Elaine on 15--13.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "NSNull+MyNull.h"

#define NSNullObjects @[@"", @0, @{}, @[]]

@implementation NSNull (MyNull)


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    
    if (!signature) {
        for (NSObject *object in NSNullObjects) {
            signature = [object methodSignatureForSelector:aSelector];
            
            if (signature) {
                break;
            }
        }
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL aSelector = [anInvocation selector];
    
    for (NSObject *object in NSNullObjects) {
        if ([object respondsToSelector:aSelector]) {
            [anInvocation invokeWithTarget:object];
            
            return;
        }
    }
    
    [self doesNotRecognizeSelector:aSelector];
}

@end
