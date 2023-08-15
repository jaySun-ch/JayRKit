//
//  JRVerifyCodeInputView.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/14.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "JRVerifyCodeInputView.h"
#import "JRPath.h"
#import "UIView+JRKit.h"
#import "CALayer+JRKit.h"
#import "CAPropertyAnimation+JRKit.h"

static NSString *const animateTip = @"fillAnimate";

@interface JRVerifyCodeInputView()

@property (nonatomic,strong) CAShapeLayer *shapeLayer;

@end


@implementation JRVerifyCodeInputView

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self.layer addSublayer:self.shapeLayer];
        [self addSubview:self.numberLabel];
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5.0;
        self.userInteractionEnabled = YES;
        [self addObserver:self forKeyPath:@"isFill" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (instancetype)init{
    return [self initWithFrame:CGRectZero];
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"isFill"];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.shapeLayer.frame = self.bounds;
    self.numberLabel.frame = self.bounds;
    switch (self.type) {
        case JRVerifyCodeInputFillSquare:
            self.shapeLayer.path = JRSqurePath(self.width);
            break;
        case JRVerifyCodeInputLine:
            self.shapeLayer.path = JRLine(self.height,CGSizeMake(self.width,3));
            break;
        case JRVerifyCodeInputFillCircle:
            self.shapeLayer.path = JRCircle(self.size,self.width / 2);
            break;
        case JRVerifyCodeInputHollowCircle:
            self.shapeLayer.path = JRCircle(self.size,self.width / 2);
            self.shapeLayer.borderWidth = 3;
            break;
        case JRVerifyCodeInputHollowSquare:
            self.shapeLayer.path = JRSqurePath(self.width);
            self.shapeLayer.borderWidth = 3;
            break;
        default:
            self.shapeLayer.path = JRRectangle(self.size);
            break;
    }
}

#pragma mark - lazy Load

JRCreateLazyLoad(CAShapeLayer*,shapeLayer,^{
    self.shapeLayer = [CAShapeLayer layer];
    if(self.type == JRVerifyCodeInputHollowCircle || self.type == JRVerifyCodeInputHollowSquare){
        self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    }else{
        self.shapeLayer.fillColor = self.normalColor.CGColor;
    }

});

JRCreateLazyLoad(UILabel *,numberLabel,^{
    self.numberLabel = [[UILabel alloc] init];
    self.numberLabel.textColor = self.labelColor;
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
});



#pragma mark - KV0
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"isFill"]){
        [self setCodeInputState];
        return;
    }
    return [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

- (void)setCodeInputState{
    
    if(self.isFill){
        if(self.type == JRVerifyCodeInputHollowCircle || self.type == JRVerifyCodeInputHollowSquare){
            self.shapeLayer.borderColor = self.fillColor.CGColor;
        }else{
            self.shapeLayer.fillColor = self.fillColor.CGColor;
        }
    }else{
        if(self.type == JRVerifyCodeInputHollowCircle || self.type == JRVerifyCodeInputHollowSquare){
            self.shapeLayer.borderColor = self.normalColor.CGColor;
        }else{
            self.shapeLayer.fillColor = self.normalColor.CGColor;
        }
        self.numberLabel.text = @"";
    }
}

#pragma mark - animate

- (void)showFillAnimate{
    [UIView animateWithDuration:0.4f animations:^{
        self.transform = CGAffineTransformMakeScale(1.2,1.2);
    }];
}

- (void)dismissFillAnimate{
    [UIView animateWithDuration:0.4f animations:^{
        self.transform = CGAffineTransformMakeScale(1.0,1.0);
    }];
}


@end
