//
//  UIView+JRKit.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITapGestureRecognizer+JRKit.h"

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

static inline JRShadowSetting JRMakeShadowSetting(CGFloat shadowOpacity,CGFloat shadowRadius, CGSize shadowOffset,UIColor *shadowColor){
    JRShadowSetting setting;
    setting.shadowColor = shadowColor;
    setting.shadowOpacity = shadowOpacity;
    setting.shadowRadius = shadowRadius;
    setting.shadowOffset = shadowOffset;
    return setting;
}

static inline JRShadowSetting JRStandardShadow(void){
    return JRMakeShadowSetting(0.3,10.0,CGSizeMake(0,0),[UIColor grayColor]);
}

static inline JRShadowSetting JRNUllShadow(void){
    return JRMakeShadowSetting(0,0,CGSizeZero,[UIColor clearColor]);
}

static inline BOOL JRShadowSettingIsNull(JRShadowSetting setting){
    if(setting.shadowColor == [UIColor clearColor]
       &&
       CGSizeEqualToSize(setting.shadowOffset, CGSizeZero)
       &&
       setting.shadowOpacity == 0
       &&
       setting.shadowRadius == 0){
        return YES;
    }
    return NO;
}


@interface UIView (JRMethodExtension)

- (void)removeAllSubViews;

- (void)makeCenter;

- (void)removeAllAnimation;

- (void)addShadowViewWithCornerRadius:(CGFloat)cornerRadius
                        shadowSetting:(JRShadowSetting)setting;

- (void)addTapAction:(void(^)(JRTarget *sender))tapAction;

@end

NS_ASSUME_NONNULL_END
