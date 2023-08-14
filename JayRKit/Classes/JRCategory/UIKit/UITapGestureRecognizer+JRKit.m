//
//  UITapGestureRecognizer+JRKit.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/7/27.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "UITapGestureRecognizer+JRKit.h"
#import <objc/runtime.h>

static char *const target_tip = "JRtarget_tip";

@implementation UITapGestureRecognizer (JRKit)

- (instancetype)initTapAction:(void (^)(JRTarget *sender))tapAction{
    self = [self init];
    if(self){
        [self addTapAction:tapAction];
    }
    return self;
}

- (void)addTapAction:(void (^)(JRTarget *sender))tapAction{
    JRTarget *target = [[JRTarget alloc] initWithAction:tapAction];
    target.context = self.view;
    [self addTarget:target action:@selector(invoke:)];
    NSMutableArray *targets = [self AllJRTapGestureTargets];
    [targets addObject:target];
}

- (void)removeAllTargets{
    NSMutableArray *targets = [self AllJRTapGestureTargets];
    [targets enumerateObjectsUsingBlock:^(JRTarget  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self removeTarget:obj action:@selector(invoke:)];
    }];
    [targets removeAllObjects];
}

- (NSMutableArray *)AllJRTapGestureTargets{
    NSMutableArray *array = objc_getAssociatedObject(self, &target_tip);
    if(!array){
        array = [NSMutableArray array];
        objc_setAssociatedObject(self,&target_tip,array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return array;
}

@end
