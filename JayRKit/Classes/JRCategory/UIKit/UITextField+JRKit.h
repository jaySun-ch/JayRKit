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

@property (nonatomic) NSUInteger maxInputWordLimit;

@property (nonatomic) NSString * maxInputString;

- (void)addWordLimit;

- (void)removeWordLimit;


@end

NS_ASSUME_NONNULL_END
