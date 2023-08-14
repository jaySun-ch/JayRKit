//
//  UIView+JRKit.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "UIView+JRKit.h"

@implementation UIView (JRKit)

- (void)removeAllSubViews{
    NSArray *subViews = self.subviews;
    if(subViews.count == 0) return;
    for(UIView *subView in subViews){
        [subView removeFromSuperview];
        [subView removeAllSubViews];
    }
}

@end
