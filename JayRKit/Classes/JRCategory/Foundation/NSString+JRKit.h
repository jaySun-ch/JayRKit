//
//  NSString+JRKit.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JRKit)

/// 模糊匹配
- (NSRange)searchStrDim:(NSString *)str;

/// 从头部匹配
- (NSRange)searchFromStart:(NSString *)str;

/// 从尾部匹配
- (NSRange)searchFromEnd:(NSString *)str;

/// 利用uncode编码进行比较
- (NSRange)searchWithUncode:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
