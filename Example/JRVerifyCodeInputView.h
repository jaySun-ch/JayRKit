//
//  JRVerifyCodeInputView.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/14.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#ifndef JRVerifyCodeInputView_h
#define JRVerifyCodeInputView_h

typedef NSUInteger JRVerifyCodeInputType;

NS_ENUM(JRVerifyCodeInputType){
    JRVerifyCodeInputCircle = 1, // circle
    JRVerifyCodeInputSquare = 2, // square
    JRVerifyCodeInputLine = 3 // down line
};

#import <UIKit/UIKit.h>

@interface JRVerifyCodeInputView : UIView

@property (nonatomic,readonly,assign) BOOL isFill;


@property (nonatomic,readonly,assign) JRVerifyCodeInputType type;



@end


#endif /* JRVerifyCodeInputView_h */
