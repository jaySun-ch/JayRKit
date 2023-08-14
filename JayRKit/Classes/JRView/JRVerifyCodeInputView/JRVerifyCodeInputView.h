//
//  JRVerifyCodeInputView.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/14.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#ifndef JRVerifyCodeInputView_h
#define JRVerifyCodeInputView_h

static CGFloat JRVerifyCodeViewHeight = 60;

typedef NSUInteger JRVerifyCodeInputType;

NS_ENUM(JRVerifyCodeInputType){
    JRVerifyCodeInputCircle = 1, // circle
    JRVerifyCodeInputSquare = 2, // square
    JRVerifyCodeInputLine = 3 // down line
};

#import <UIKit/UIKit.h>

@interface JRVerifyCodeInputView : UIView

@property (nonatomic,assign) BOOL isFill;

@property (nonatomic,assign) JRVerifyCodeInputType type;

@property (nonatomic,strong) UILabel *numberLabel;


@end


#endif /* JRVerifyCodeInputView_h */
