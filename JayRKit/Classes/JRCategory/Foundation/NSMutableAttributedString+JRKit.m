//
//  NSMutableAttributedString+JRKit.m
//  JayRKit
//
//  Created by 孙志雄 on 2023/8/15.
//

#import "NSMutableAttributedString+JRKit.h"
#import "NSAttributedString+JRKit.h"


@implementation NSMutableAttributedString (JRKit)

JR_DYNAMIC_PROPERTY_OBJECT_Implementation(attributedDict,setAttributedDict,RETAIN,NSMutableDictionary *);

- (void)addBackgroundColorArt:(UIColor *)color range:(NSRange)range{
    [self addAttribute:NSBackgroundColorAttributeName value:color range:range];
}

- (void)addTextColorArt:(UIColor *)color range:(NSRange)range{
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

- (void)addFontArt:(UIFont *)font range:(NSRange)range{
    [self addAttribute:NSFontAttributeName value:font range:range];
}




@end
