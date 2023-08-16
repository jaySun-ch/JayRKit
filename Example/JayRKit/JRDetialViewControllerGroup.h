//
//  JRDetialViewControllerGroup.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/15.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JayRKit.h"

#ifndef JRDetialViewControllerGroup_h
#define JRDetialViewControllerGroup_h

JRCreateClassInterface(JRVerifyCodeInputViewController,
                       UIViewController<JRFillVerifyCodeViewDelegate>,
                       JRCreatePropertyWithArgs(strong,JRFillVerifyCodeView *,exampleView));


JRCreateClassInterface(
                       JRDropTextFieldViewController<JRDropTextFieldDataSource>,
                       UIViewController<JRDropTextFieldDelegate>,
                       JRCreatePropertyWithArgs(strong,JRDropTextField *,exampleView));


JRCreateClassInterface(
                       JRPopExampleViewController,
                       JRPopViewController<JRPopPresentable>,
                       JRCreatePropertyWithArgs(strong,UILabel *,exampleView));

JRCreateClassInterface(
                       JRPopTestViewController,
                       UIViewController,
                       JRCreatePropertyWithArgs(strong,UIButton *,exampleView));




#endif /* JRDetialViewControllerGroup_h */
