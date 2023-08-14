//
//  UIView+JRKit.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "UIView+JRKit.h"

@implementation UIView (JRKit)


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

- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX{
    CGPoint orgincenter = self.center;
    orgincenter.x = centerX;
    self.center = orgincenter;
}

- (CGFloat)centerY{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY{
    CGPoint orgincenter = self.center;
    orgincenter.y = centerY;
    self.center = orgincenter;
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


@implementation UIView (JRMethodExtension)

- (void)removeAllSubViews{
    NSArray *subViews = self.subviews;
    if(subViews.count == 0) return;
    for(UIView *subView in subViews){
        [subView removeFromSuperview];
        [subView removeAllSubViews];
    }
}

- (void)makeCenter{
    self.center = self.superview.center;
}

+ (void)load{
    [super load];
    NSLog(@"View has Load");
}

- (void)layoutSubviews{
    NSLog(@"----layoutSubviews 被调用-----");
}

- (void)layoutIfNeeded{
    NSLog(@"----layoutIfNeeded 被调用-----");
}

- (void)setNeedsLayout{
    NSLog(@"---setNeedsLayout 被调用 -----");
}



@end
