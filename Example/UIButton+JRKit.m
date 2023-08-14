//
//  UIButton+JRKit.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/7/28.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "UIButton+JRKit.h"
#import "UIControl+JRKit.h"

@implementation UIButton (JRKit)

- (instancetype)initWithAction:(void (^)(JRTarget * sender))action
                     event:(UIControlEvents)event{
    self = [self init];
    if(self){
        [self addBlockAction:action forControlEvents:event];
    }
    return self;
}


@end
