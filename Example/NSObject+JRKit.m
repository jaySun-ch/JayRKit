//
//  NSObject+JRKit.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/7/27.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "NSObject+JRKit.h"
#import <objc/runtime.h>

@implementation NSObject (JRKit)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay{
    if(!block) return;
  
    IMP blockImp = imp_implementationWithBlock(block);
    const char *types = [[NSString stringWithFormat:@"%s%s%s", @encode(id), @encode(SEL), @encode(void (^)(void))] UTF8String];
    class_addMethod([self class],@selector(unBlock), blockImp, types);
    [self performSelector:@selector(unBlock) withObject:nil afterDelay:delay];
}

- (id)msgSendToClass:(Class)Class selector:(SEL)sel params:(NSArray *)params{
    id result = nil;
    Method method = class_getClassMethod(Class, sel);
    if(!method){
        if([Class respondsToSelector:sel]){
            NSMethodSignature *signature = [Class methodSignatureForSelector:sel];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            [invocation setTarget:Class];
            [invocation setSelector:sel];
            for(int i = 0 ; i < params.count ; i ++){
                id param = params[i];
                [invocation setArgument:&param atIndex:i+2];
            }
            [invocation invoke];// 执行这个方法
            [invocation getReturnValue:&result];
            return result;
        }
    }
    return result;
}

- (id)msgSendToInstance:(id)instance selector:(SEL)sel params:(NSArray *)params{
    id result = nil;
    if(instance && sel){
        if([instance respondsToSelector:sel]){
            NSMethodSignature *signature = [instance methodSignatureForSelector:sel];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            [invocation setTarget:instance];
            [invocation setSelector:sel];
            for(int i = 0 ; i < params.count ; i ++){
                id param = params[i];
                [invocation setArgument:&param atIndex:i+2];
            }
            [invocation invoke];// 执行这个方法
            void *vvl;
            @try {
                // 可能发生异常的代码
                [invocation getReturnValue:&vvl];
                result = (__bridge id)vvl;
            } @catch (NSException *exception) {
                // 处理异常
                NSLog(@"%@ NSException",exception);
            }@finally {
                //  finalize,即使前面发生异常也会执行
                return result;
            };
        }
    }
    return result;
}


- (void)printObjectProperties{
  unsigned int count;
  objc_property_t *properties = class_copyPropertyList([self class], &count);
  for (int i = 0; i < count; i++) {
    objc_property_t property = properties[i];
    fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
  }
  free(properties);
}


- (void)printObjectMethodList{
    unsigned int count;
    Method *methodList = class_copyMethodList([self class], &count);
    for(int i = 0; i < count; i++){
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        NSLog(@"%s arg_num=%d\n",sel_getName(methodName),method_getNumberOfArguments(method));
    }
    free(methodList);
}



#pragma mark - private
- (void)unBlock{};

@end
