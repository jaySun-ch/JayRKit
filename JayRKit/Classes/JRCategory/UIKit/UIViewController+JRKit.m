//
//  UIViewController+JRKit.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "UIViewController+JRKit.h"
#import "UIView+JRKit.h"
#import "JRMacro.h"

#define JRVC_CreatePROPERTY(setter,getter) \
- (UIColor *)setter{ \
    return self.view.setter; \
}\
- (void)set##getter:(UIColor *)setter{\
    self.view.setter = setter;\
}\

@implementation UIViewController (JRKit)

JRVC_CreatePROPERTY(backgroundColor,BackgroundColor);

- (CGRect)bounds{
    return self.view.bounds;
}

@end


@implementation UIViewController (JRMethodExtension)

- (void)addSubView:(UIView *)subView{
    [self.view addSubview:subView];
}

- (void)removeAllSubViews{
    [self.view removeAllSubViews];
}

@end
