//
//  UIButton+JRKit.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/7/28.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRTarget.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (JRKit)

- (instancetype)initWithAction:(void (^)(JRTarget * sender))action
                     event:(UIControlEvents)event;



@end

NS_ASSUME_NONNULL_END
