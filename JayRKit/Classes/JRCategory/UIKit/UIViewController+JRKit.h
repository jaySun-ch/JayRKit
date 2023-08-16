//
//  UIViewController+JRKit.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRPopViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JRKit)

@property (nonatomic) UIColor *backgroundColor;

- (CGRect)bounds;



@end

@interface UIViewController (JRMethodExtension)

- (void)addSubView:(UIView *)subView;

- (void)removeAllSubViews;

@end


@interface UIViewController (JRPopViewController)

- (void)jr_presentPopViewController:(JRPopViewController *)vc animated:(BOOL)animated completion:(void (^)(void))completion;

- (void)jr_presentPopViewController:(JRPopViewController *)vc;



@end

NS_ASSUME_NONNULL_END
