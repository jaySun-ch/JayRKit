//
//  UILabel+JRKit.m
//  JayRKit
//
//  Created by 孙志雄 on 2023/8/15.
//

#import "UILabel+JRKit.h"


@implementation UILabel (JRKit)

- (void)addTextHLWithColor:(UIColor *)hightlightColor range:(NSRange)range{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.text];
    [string addTextColorArt:hightlightColor range:range];
    [self setAttributedText:string];
}


- (void)addBackgroundHLWithColor:(UIColor *)hightlightColor range:(NSRange)range{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.text];
    [string addBackgroundColorArt:hightlightColor range:range];
    [self setAttributedText:string];
}

- (void)addFontHLWithColor:(UIFont *)font range:(NSRange)range{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.text];
    [string addFontArt:font range:range];
    [self setAttributedText:string];
}



@end
