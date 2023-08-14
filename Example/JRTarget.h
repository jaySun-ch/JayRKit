//
//  NSObject+JRTarget.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/7/28.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JRTarget : NSObject

@property (nonatomic,copy) void (^action)(JRTarget *sender);

- (instancetype)initWithAction:(void (^)(JRTarget *sender))action;

- (void)invoke:(id)sender;

@end

NS_ASSUME_NONNULL_END
