//
//  JRPopViewController.h
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/16.
//

#ifndef JRPopViewController_h
#define JRPopViewController_h
#import "UIView+JRKit.h"

typedef NSInteger JRPopTransAnimateStyle;

NS_ENUM(JRPopTransAnimateStyle){
    JRPopTransAnimateDefault = 1,
    JRPopTransAnimateSpring
};

@protocol JRPopPresentable <NSObject>

@required
- (CGFloat)popViewHeight;


@optional
- (CGFloat)viewCornerRadius;

- (BOOL)isAllowTapBackgroundDismiss;

- (JRShadowSetting)viewShadowSetting;

- (BOOL)isShowTapBackground;

- (JRPopTransAnimateStyle)popAnimateStyle;

- (BOOL)isAllowScrollToDimiss;


@end


#import <UIKit/UIKit.h>

@interface JRPopViewController : UIViewController


@end

#endif /* JRPopViewController_h */
