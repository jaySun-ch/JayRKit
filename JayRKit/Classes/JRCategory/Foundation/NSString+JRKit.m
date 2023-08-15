//
//  NSString+JRKit.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "NSString+JRKit.h"

@implementation NSString (JRKit)

- (NSRange)searchStrDim:(NSString *)str{
    return [self rangeOfString:str options:NSCaseInsensitiveSearch];
}

- (NSRange)searchFromStart:(NSString *)str{
    return [self rangeOfString:str options:NSAnchoredSearch];
}

- (NSRange)searchFromEnd:(NSString *)str{
    return [self rangeOfString:str options:NSBackwardsSearch];
}

- (NSRange)searchWithUncode:(NSString *)str{
    return [self rangeOfString:str options:NSLiteralSearch];
}



@end



