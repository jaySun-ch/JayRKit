//
//  JRFillVerifyCodeView.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/14.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#ifndef JRFillVerifyCodeView_h
#define JRFillVerifyCodeView_h

#import <UIKit/UIKit.h>
#import "JRVerifyCodeInputView.h"

@protocol JRFillVerifyCodeViewDelegate <NSObject>

@required
- (void)didFinishFillVerifyCode:(NSString *)verifyCode;

@end

@interface JRFillVerifyCodeView : UIView

@property (nonatomic,weak) id<JRFillVerifyCodeViewDelegate> delegate;

- (instancetype)initWithCodeNumberLength:(NSUInteger)length style:(JRVerifyCodeInputType)style;

@end

#endif /* JRFillVerifyCodeView_h */
