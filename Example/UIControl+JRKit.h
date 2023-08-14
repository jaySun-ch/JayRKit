//
//  UIControl+JRKit.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRTarget.h"


static inline NSString* JRStringFormControlEvent(UIControlEvents event);

static inline UIControlEvents JRControlEventFormString(NSString *EventName);

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (JRKit)

- (void)addBlockAction:(void (^)(JRTarget *sender))blockAction forControlEvents:(UIControlEvents)controlEvents;

@end

NS_ASSUME_NONNULL_END
