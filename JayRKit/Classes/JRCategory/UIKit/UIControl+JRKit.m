//
//  UIControl+JRKit.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "UIControl+JRKit.h"
#import <objc/runtime.h>

static char *const blockTargetsTip = "blockTargetsTip";



@implementation UIControl (JRKit)

- (void)addBlockAction:(void (^)(JRTarget *sender))blockAction forControlEvents:(UIControlEvents)controlEvents{
    JRTarget *target = [[JRTarget alloc] initWithAction:blockAction];
    target.context = self;
    [self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
    NSString *eventName = JRStringFormControlEvent(controlEvents);
    NSAssert(eventName != nil,@"please check UIControlEvents is exist");
    NSMutableDictionary *allBlockTargets = [self allBlockTargets];
    if(allBlockTargets[eventName]){
        // 如果这个key存在
        [allBlockTargets setValue:target forKey:eventName];
        return;
    }
    [allBlockTargets setObject:target forKey:eventName];
}

- (void)removeAllTargets{
    NSMutableDictionary *targets = [self allBlockTargets];
    [targets.allKeys enumerateObjectsUsingBlock:^(NSString  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        JRTarget *target = [targets valueForKey:obj];
        UIControlEvents event = JRControlEventFormString(obj);
        NSAssert(event != 0,@"please check UIControlEvents is exist");
        [self removeTarget:target action:@selector(invoke:) forControlEvents:event];
    }];
    [targets removeAllObjects];
}

- (NSMutableDictionary *)allBlockTargets{
    NSMutableDictionary *blockTargets = objc_getAssociatedObject(self,&blockTargetsTip);
    if(!blockTargets){
        blockTargets = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self,&blockTargetsTip,blockTargets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return blockTargets;
}

@end
