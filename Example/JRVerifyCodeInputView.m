//
//  JRVerifyCodeInputView.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/14.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "JRVerifyCodeInputView.h"
#import "JRMacro.h"
#import "UIView+JRKit.h"
#import "JRPath.h"

@interface JRVerifyCodeInputView()

@property (nonatomic,strong) CAShapeLayer *shapeLayer;

@property (nonatomic,strong) UILabel *numberLabel;

@end


@implementation JRVerifyCodeInputView


- (instancetype)init{
    self = [super init];
    if(self){
        [self.layer addSublayer:self.shapeLayer];
        [self addSubview:self.numberLabel];
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5.0;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.shapeLayer.frame = self.bounds;
    self.numberLabel.frame = self.bounds;
//    [self.numberLabel makeCenter];
    self.shapeLayer.path = JRCircle(self.width,10);
}

#pragma mark - lazy Load

JRCreateLazyLoad(CAShapeLayer*,shapeLayer,^{
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.fillColor = [UIColor blackColor].CGColor;
});

JRCreateLazyLoad(UILabel *,numberLabel,^{
    _numberLabel = [[UILabel alloc] init];
    _numberLabel.text = @"1";
    _numberLabel.textColor = [UIColor whiteColor];
    _numberLabel.textAlignment = NSTextAlignmentCenter;
    _numberLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
});







@end
