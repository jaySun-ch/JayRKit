//
//  UITapGestureRecognizer+JRKit.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/7/27.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRTarget.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITapGestureRecognizer (JRKit)

- (instancetype)initTapAction:(void (^)(JRTarget *sender))tapAction;

- (void)addTapAction:(void (^)(JRTarget *sender))tapAction;


@end

NS_ASSUME_NONNULL_END
