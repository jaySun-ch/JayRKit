//
//  UILabel+JRKit.m
//  JayRKit
//
//  Created by 孙志雄 on 2023/8/15.
//

#import "UILabel+JRKit.h"

@implementation UILabel (JRKit)

- (void)addTextHLWithColor:(UIColor *)hightlightColor range:(NSRange)range{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [string addTextColorArt:hightlightColor range:range];
    [self setAttributedText:[string copy]];
}


- (void)addBackgroundHLWithColor:(UIColor *)hightlightColor range:(NSRange)range{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [string addBackgroundColorArt:hightlightColor range:range];
    [self setAttributedText:[string copy]];
}

- (void)addFontHLWithFont:(UIFont *)font range:(NSRange)range{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [string addFontArt:font range:range];
    [self setAttributedText:[string copy]];
}



@end
