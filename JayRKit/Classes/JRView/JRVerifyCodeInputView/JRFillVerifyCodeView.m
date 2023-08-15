//
//  JRFillVerifyCodeView.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/14.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "JRFillVerifyCodeView.h"
#import "JRDefine.h"
#import "UIView+JRKit.h"
#import "UITapGestureRecognizer+JRKit.h"
#import "UITextField+JRKit.h"
#import "UIControl+JRKit.h"
#import "JRMacro.h"

@interface JRFillVerifyCodeView()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *textFiled;

@property (nonatomic,assign) NSUInteger length;

@property (nonatomic,assign) NSUInteger currentLength;

@end

@implementation JRFillVerifyCodeView

- (instancetype)initWithCodeNumberLength:(NSUInteger)length
                             style:(JRVerifyCodeInputType)style{
    return [self initWithCodeNumberLength:length style:style size:CGSizeZero];
}


- (instancetype)initWithCodeNumberLength:(NSUInteger)length
                             style:(JRVerifyCodeInputType)style
                              size:(CGSize)size
{
    self = [super init];
    if(self){
        self.length = length;
        self.currentLength = 0;
        CGFloat x = 0;
        if(CGSizeEqualToSize(size,CGSizeZero)){
            size = CGSizeMake(JRScreenSize.width,JRVerifyCodeViewHeight);
        }
        CGFloat padding = 10;
        x += padding;
        CGFloat width = (size.width - padding * (length + 1)) / length;
        for(int i = 0; i < length; i++){
            JRVerifyCodeInputView *view = [[JRVerifyCodeInputView alloc] initWithFrame:CGRectMake(x,0,width,size.height)];
            view.normalColor = [UIColor grayColor];
            view.fillColor = [UIColor redColor];
            view.labelColor = [UIColor whiteColor];
            view.tag = (i+1) << 10;
            view.type = style;
            x += width;
            x += padding;
            [self addSubview:view];
            UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initTapAction:^(JRTarget * _Nonnull sender) {
                if(!self.textFiled.isFirstResponder){
                    JRVerifyCodeInputView *view = (JRVerifyCodeInputView *)[self viewWithTag:((self.currentLength + 1) << 10)];
                    [view showFillAnimate];
                    [self.textFiled becomeFirstResponder];
                }else{
                    [self stopEdit];
                    [self.textFiled resignFirstResponder];
                }
            }];
            [view addGestureRecognizer:gesture];
        }
        self.size = size;
        [self addSubview:self.textFiled];
    }
    return self;
}

#pragma mark - lazy load

JRCreateLazyLoad(UITextField *,textFiled, ^{
    self.textFiled = [[UITextField alloc] initWithFrame:self.bounds];
    self.textFiled.delegate = self;
    self.textFiled.alpha = 0;
    self.textFiled.maxInputWordLimit = self.length;
    [self.textFiled addWordLimit];
    self.textFiled.keyboardType = UIKeyboardTypeNumberPad;
});

#pragma mark - textFiledDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self stopEdit];
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidChangeSelection:(UITextField *)textField{
    NSUInteger textlength = textField.text.length;
    if(textlength <= self.length && textlength >= 0){
        JRVerifyCodeInputView *currentView = (JRVerifyCodeInputView *)[self viewWithTag:((self.currentLength + 1) << 10)];
        if(self.currentLength < textlength){
            currentView.numberLabel.text = [textField.text substringWithRange:NSMakeRange(self.currentLength,1)];
            currentView.isFill = YES;
        }else{
            currentView = (JRVerifyCodeInputView *)[self viewWithTag:((textlength + 1) << 10)];
            currentView.isFill = NO;
        }
        self.currentLength = textlength;
        [self onlyShowFillAnimateWithIndex:self.currentLength];
    }
    if(textlength >= self.length){
        if(_delegate){
            [_delegate didFinishFillVerifyCode:self.textFiled.maxInputString];
        }
    }
}

- (void)stopEdit{
    for(int i = 0; i < self.length; i++){
        JRVerifyCodeInputView *view = (JRVerifyCodeInputView *)[self viewWithTag:((i + 1) << 10)];
        [view dismissFillAnimate];
    }
}

- (void)onlyShowFillAnimateWithIndex:(NSInteger)index{
    for(int i = 0; i < self.length; i++){
        JRVerifyCodeInputView *view = (JRVerifyCodeInputView *)[self viewWithTag:((i + 1) << 10)];
        if(i == index){
            [view showFillAnimate];
        }else{
            [view dismissFillAnimate];
        }
    }
}






@end
