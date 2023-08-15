//
//  UIView+JRKit.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JRKit)

/// the origin for view
@property (nonatomic) CGPoint origin;
/// the origin.x for view
@property (nonatomic) CGFloat x;
/// the origin.y for view
@property (nonatomic) CGFloat y;
/// the left for view
@property (nonatomic) CGFloat left;
/// the right for view
@property (nonatomic) CGFloat right;
/// the bottom for view
@property (nonatomic) CGFloat bottom;
/// the top for view
@property (nonatomic) CGFloat top;
/// the size for view
@property (nonatomic) CGSize size;
/// the centerX for view
@property (nonatomic) CGFloat centerX;
/// the centerY for view
@property (nonatomic) CGFloat centerY;
/// the height for view
@property (nonatomic) CGFloat height;
/// the width for view
@property (nonatomic) CGFloat width;

@end

typedef struct JRShadowSetting{
    CGFloat shadowOpacity;
    CGFloat shadowRadius;
    CGSize shadowOffset;
    UIColor *shadowColor;
}JRShadowSetting;

@interface UIView (JRMethodExtension)

- (void)removeAllSubViews;

- (void)makeCenter;

- (void)removeAllAnimation;

- (void)addShadowViewWithCornerRadius:(CGFloat)cornerRadius
                        shadowSetting:(JRShadowSetting)setting;

@end

NS_ASSUME_NONNULL_END
