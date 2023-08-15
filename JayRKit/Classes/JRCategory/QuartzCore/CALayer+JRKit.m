//
//  CALayer+JRKit.m
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/15.
//

#import "CALayer+JRKit.h"

@implementation CALayer (JRKit)

-(CGFloat)x{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x{
    CGRect originFrame = self.frame;
    originFrame.origin = CGPointMake(x, self.frame.origin.y);
    self.frame = originFrame;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y{
    CGRect originFrame = self.frame;
    originFrame.origin = CGPointMake(self.frame.origin.x,y);
    self.frame = originFrame;
}

-(CGPoint)origin{
    return self.frame.origin;
}

-(void)setOrigin:(CGPoint)origin{
    CGRect originFrame = self.frame;
    originFrame.origin = origin;
    self.frame = originFrame;
}

- (CGSize)size{
    return self.frame.size;
}

- (void)setSize:(CGSize)size{
    CGRect originFrame = self.frame;
    originFrame.size = size;
    self.frame = originFrame;
}

- (CGFloat)height{
    return self.size.height;
}

- (void)setHeight:(CGFloat)height{
    CGSize originsize = self.size;
    originsize.height = height;
    self.size = originsize;
}

- (CGFloat)width{
    return self.size.width;
}

- (void)setWidth:(CGFloat)width{
    CGSize originsize = self.size;
    originsize.width = width;
    self.size = originsize;
}

- (CGFloat)left{
    return self.origin.x;
}

- (void)setLeft:(CGFloat)left{
    self.origin = CGPointMake(left,self.y);
}

- (CGFloat)right{
    return self.origin.x + self.width;
}

- (void)setRight:(CGFloat)right{
    self.origin = CGPointMake(right - self.width,self.y);
}

- (CGFloat)bottom{
    return self.y + self.height;
}

- (void)setBottom:(CGFloat)bottom{
    self.origin = CGPointMake(self.x,bottom - self.height);
}

- (CGFloat)top{
    return self.y;
}

- (void)setTop:(CGFloat)top{
    self.origin = CGPointMake(self.x,top);
}

@end
