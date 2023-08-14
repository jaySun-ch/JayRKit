//
//  UITextField+JRKit.h
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (JRKit)

- (NSUInteger)maxInputWordLimit;

- (void)setMaxInputWordLimit:(NSUInteger )object;

- (NSString *)maxInputString;

- (void)setMaxInputString:(NSString *)object;

- (void)addWordLimit;

- (void)removeWordLimit;


@end

NS_ASSUME_NONNULL_END
