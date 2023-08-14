//
//  NSObject+JRTarget.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/7/28.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "JRTarget.h"

@implementation JRTarget

- (instancetype)initWithAction:(void (^)(JRTarget *sender))action{
    self = [super init];
    if(self){
        _action = [action copy];
    }
    return self;
}

- (void)invoke:(JRTarget *)sender{
    if(_action){
        _action(sender);
    }
}

@end
