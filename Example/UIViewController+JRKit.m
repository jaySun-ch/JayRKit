//
//  UIViewController+JRKit.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "UIViewController+JRKit.h"
#import "UIView+JRKit.h"

@implementation UIViewController (JRKit)

- (void)addSubView:(UIView *)subView{
    [self.view addSubview:subView];
}

- (void)removeAllSubViews{
    [self.view removeAllSubViews];
}

@end
