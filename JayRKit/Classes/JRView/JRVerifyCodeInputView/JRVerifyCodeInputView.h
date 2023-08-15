//
//  JRVerifyCodeInputView.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/14.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#ifndef JRVerifyCodeInputView_h
#define JRVerifyCodeInputView_h

#import "JRMacro.h"

static CGFloat JRVerifyCodeViewHeight = 60;

typedef NSUInteger JRVerifyCodeInputType;

NS_ENUM(JRVerifyCodeInputType){
    JRVerifyCodeInputFillCircle = 1, // fill circle
    JRVerifyCodeInputFillSquare = 2, // fill square
    JRVerifyCodeInputHollowCircle = 3, // hollow circle
    JRVerifyCodeInputHollowSquare = 4, // hollow square
    JRVerifyCodeInputLine = 5 // down line
};

typedef NS_OPTIONS(NSUInteger,JRVerifyCodeFillAnimateStyle){
    JRVerifyCodeFillAnimateNormal = 1 << 10,
    JRVerifyCodeFillAnimateShake = 2 << 10
};


#import <UIKit/UIKit.h>


@interface JRVerifyCodeInputView : UIView

@property (nonatomic,assign) BOOL isFill;

@property (nonatomic) UIColor *fillColor;

@property (nonatomic) UIColor *normalColor;

@property (nonatomic) UIColor *labelColor;

@property (nonatomic) JRVerifyCodeFillAnimateStyle style;

@property (nonatomic,assign) JRVerifyCodeInputType type;

@property (nonatomic,strong) UILabel *numberLabel;

- (void)showFillAnimate;

- (void)dismissFillAnimate;


@end


#endif /* JRVerifyCodeInputView_h */
