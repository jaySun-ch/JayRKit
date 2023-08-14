//
//  UIViewController+JRKit.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JRKit)

- (void)addSubView:(UIView *)subView;

- (void)removeAllSubViews;

@end

NS_ASSUME_NONNULL_END
