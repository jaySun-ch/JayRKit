//
//  CAPropertyAnimation+JRKit.m
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/15.
//

#import "CAPropertyAnimation+JRKit.h"


@implementation CAPropertyAnimation (JRKit)


+ (instancetype)animationWithKeyPathType:(CAAnimationKeyPathType)type{
    return [self animationWithKeyPath:type];
}

@end
