//
//  NSObject+JRKit.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/7/27.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JRKit)

- (void)printObjectProperties;

- (void)printObjectMethodList;

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

- (id)msgSendToInstance:(id)instance selector:(SEL)sel params:(NSArray *)params;

- (id)msgSendToClass:(Class)Class selector:(SEL)sel params:(NSArray *)params;

@end

NS_ASSUME_NONNULL_END
