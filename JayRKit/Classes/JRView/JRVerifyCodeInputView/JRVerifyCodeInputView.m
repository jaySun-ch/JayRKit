//
//  JRVerifyCodeInputView.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/14.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "JRVerifyCodeInputView.h"
#import "JRMacro.h"
#import "JRPath.h"
#import "UIView+JRKit.h"

@interface JRVerifyCodeInputView()

@property (nonatomic,strong) CAShapeLayer *shapeLayer;

@end


@implementation JRVerifyCodeInputView

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
        case JRVerifyCodeInputSquare:
            self.shapeLayer.path = JRSqurePath(self.width);
            break;
        case JRVerifyCodeInputLine:
            break;
        case JRVerifyCodeInputCircle:
            self.shapeLayer.path = JRCircle(self.size,self.width / 2);
            break;
        default:
            self.shapeLayer.path = JRRectangle(self.size);
            break;
    }
}

#pragma mark - lazy Load

JRCreateLazyLoad(CAShapeLayer*,shapeLayer,^{
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.fillColor = [UIColor whiteColor].CGColor;
});

JRCreateLazyLoad(UILabel *,numberLabel,^{
    self.numberLabel = [[UILabel alloc] init];
    self.numberLabel.textColor = [UIColor whiteColor];
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
});


- (void)setCodeInputState{
    if(self.isFill){
        self.shapeLayer.fillColor = [UIColor blackColor].CGColor;
    }else{
        self.shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        self.numberLabel.text = @"";
    }
}

#pragma mark - KV0
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"isFill"]){
        [self setCodeInputState];
        return;
    }
    return [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}



@end
