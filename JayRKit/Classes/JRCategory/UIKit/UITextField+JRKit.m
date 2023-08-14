//
//  UITextField+JRKit.m
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "UITextField+JRKit.h"
#import "JRMacro.h"

@implementation UITextField (JRKit)

JR_DYNAMIC_PROPERTY_CTYPE(maxInputWordLimit,setMaxInputWordLimit,RETAIN,NSUInteger);

JR_DYNAMIC_PROPERTY_OBJECT(maxInputString,setMaxInputString,RETAIN,NSString *);


- (void)addWordLimit{
    [self addTarget:self action:@selector(textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)removeWordLimit{
    [self removeTarget:self action:@selector(textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}

// 实现方法
- (void)textFieldTextDidChange{
    // 文本变化处理
    if(self.text.length > self.maxInputWordLimit){
        self.text = self.maxInputString;
    }else if(self.text.length == self.maxInputWordLimit){
        self.maxInputString = self.text;
    }
}


@end
