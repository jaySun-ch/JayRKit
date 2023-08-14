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

static inline NSString* JRStringFormControlEvent(UIControlEvents event){
    if (event == UIControlEventTouchDown) {
       return @"UIControlEventTouchDown";

     } else if (event == UIControlEventTouchDownRepeat) {
       return @"UIControlEventTouchDownRepeat";

     } else if (event == UIControlEventTouchDragInside) {
       return @"UIControlEventTouchDragInside";

     } else if (event == UIControlEventTouchDragOutside) {
       return @"UIControlEventTouchDragOutside";

     } else if (event == UIControlEventTouchDragEnter) {
       return @"UIControlEventTouchDragEnter";

     } else if (event == UIControlEventTouchDragExit) {
       return @"UIControlEventTouchDragExit";

     } else if (event == UIControlEventTouchUpInside) {
       return @"UIControlEventTouchUpInside";

     } else if (event == UIControlEventTouchUpOutside) {
       return @"UIControlEventTouchUpOutside";

     } else if (event == UIControlEventTouchCancel) {
       return @"UIControlEventTouchCancel";

     } else if (event == UIControlEventValueChanged) {
       return @"UIControlEventValueChanged";

     } else if (event == UIControlEventPrimaryActionTriggered) {
       return @"UIControlEventPrimaryActionTriggered";

     }else if (event == UIControlEventEditingDidBegin) {
       return @"UIControlEventEditingDidBegin";

     } else if (event == UIControlEventEditingChanged) {
       return @"UIControlEventEditingChanged";

     } else if (event == UIControlEventEditingDidEnd) {
       return @"UIControlEventEditingDidEnd";

     } else if (event == UIControlEventEditingDidEndOnExit) {
       return @"UIControlEventEditingDidEndOnExit";

     } else if (event == UIControlEventAllTouchEvents) {
       return @"UIControlEventAllTouchEvents";

     } else if (event == UIControlEventAllEditingEvents) {
       return @"UIControlEventAllEditingEvents";

     } else if (event == UIControlEventApplicationReserved) {
       return @"UIControlEventApplicationReserved";

     } else if (event == UIControlEventSystemReserved) {
       return @"UIControlEventSystemReserved";

     } else if (event == UIControlEventAllEvents) {
       return @"UIControlEventAllEvents";

     } else {
         
         if (@available(iOS 14.0, *)) {
             if (event == UIControlEventMenuActionTriggered) {
                 return @"UIControlEventMenuActionTriggered";
             }
         }
         
        return nil;
     }
}

static inline UIControlEvents JRControlEventFormString(NSString *EventName){
    if ([EventName isEqualToString:@"UIControlEventTouchDown"]) {
        return UIControlEventTouchDown;

      } else if ([EventName isEqualToString:@"UIControlEventTouchDownRepeat"]) {
        return UIControlEventTouchDownRepeat;

      } else if ([EventName isEqualToString:@"UIControlEventTouchDragInside"]) {
        return UIControlEventTouchDragInside;

      } else if ([EventName isEqualToString:@"UIControlEventTouchDragOutside"]) {
        return UIControlEventTouchDragOutside;

      } else if ([EventName isEqualToString:@"UIControlEventTouchDragEnter"]) {
        return UIControlEventTouchDragEnter;

      } else if ([EventName isEqualToString:@"UIControlEventTouchDragExit"]) {
        return UIControlEventTouchDragExit;

      } else if ([EventName isEqualToString:@"UIControlEventTouchUpInside"]) {
        return UIControlEventTouchUpInside;

      } else if ([EventName isEqualToString:@"UIControlEventTouchUpOutside"]) {
        return UIControlEventTouchUpOutside;

      } else if ([EventName isEqualToString:@"UIControlEventTouchCancel"]) {
        return UIControlEventTouchCancel;

      } else if ([EventName isEqualToString:@"UIControlEventValueChanged"]) {
        return UIControlEventValueChanged;

      } else if ([EventName isEqualToString:@"UIControlEventPrimaryActionTriggered"]) {
        return UIControlEventPrimaryActionTriggered;

      } else if ([EventName isEqualToString:@"UIControlEventMenuActionTriggered"]) {
          if (@available(iOS 14.0, *)) {
              return UIControlEventMenuActionTriggered;
          } else {
              // Fallback on earlier versions
              return 0;
          }
      } else if ([EventName isEqualToString:@"UIControlEventEditingDidBegin"]) {
        return UIControlEventEditingDidBegin;

      } else if ([EventName isEqualToString:@"UIControlEventEditingChanged"]) {
        return UIControlEventEditingChanged;

      } else if ([EventName isEqualToString:@"UIControlEventEditingDidEnd"]) {
        return UIControlEventEditingDidEnd;

      } else if ([EventName isEqualToString:@"UIControlEventEditingDidEndOnExit"]) {
        return UIControlEventEditingDidEndOnExit;

      } else if ([EventName isEqualToString:@"UIControlEventAllTouchEvents"]) {
        return UIControlEventAllTouchEvents;

      } else if ([EventName isEqualToString:@"UIControlEventAllEditingEvents"]) {
        return UIControlEventAllEditingEvents;

      } else if ([EventName isEqualToString:@"UIControlEventApplicationReserved"]) {
        return UIControlEventApplicationReserved;

      } else if ([EventName isEqualToString:@"UIControlEventSystemReserved"]) {
        return UIControlEventSystemReserved;

      } else if ([EventName isEqualToString:@"UIControlEventAllEvents"]) {
        return UIControlEventAllEvents;
      } else {
        return 0;
      }
}


@implementation UIControl (JRKit)

- (void)addBlockAction:(void (^)(JRTarget *sender))blockAction forControlEvents:(UIControlEvents)controlEvents{
    JRTarget *target = [[JRTarget alloc] initWithAction:blockAction];
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
