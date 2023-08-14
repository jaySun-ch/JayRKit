//
//  NSObject+JRDebugManager.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/7/27.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "JRDebugManager.h"

@interface JRDebugManager()

@property (nonatomic,strong) UIWindow *window;

@property (nonatomic,strong) UIButton *deBugButton;

@end

@implementation JRDebugManager

+ (JRDebugManager *)shareManager{
    static dispatch_once_t once;
    static JRDebugManager *manager;
    dispatch_once(&once, ^{
        manager = [[JRDebugManager alloc] init];
    });
    return manager;
}

- (instancetype)init{
    self = [super init];
    if(self){
        [self addObserver:[UIApplication sharedApplication] forKeyPath:@"keyWindow" options:NSKeyValueObservingOptionNew context:nil];
        [self.window addSubview:self.deBugButton];
    }
    return self;
}

#pragma mark - lazy load
- (UIWindow *)window{
    if(!_window){
        _window = [UIApplication sharedApplication].keyWindow;
    }
    return _window;
}

- (UIButton *)deBugButton{
    if(!_deBugButton){
        _deBugButton = [[UIButton alloc] initWithFrame:CGRectMake(UIScreen.mainScreen.bounds.size.width-60, UIScreen.mainScreen.bounds.size.height - 100, 50, 50)];
        [_deBugButton setImage:[UIImage systemImageNamed:@"hammer.circle"] forState:UIControlStateNormal];
        _deBugButton.backgroundColor = [UIColor redColor];
        [_deBugButton setTintColor:UIColor.blueColor];
    }
    return _deBugButton;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"keyWindow"]) {
        self.window = [UIApplication sharedApplication].keyWindow;
        NSLog(@"shhhd");
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc{
    [self removeObserver:[UIApplication sharedApplication] forKeyPath:@"keyWindow"];
}

@end
