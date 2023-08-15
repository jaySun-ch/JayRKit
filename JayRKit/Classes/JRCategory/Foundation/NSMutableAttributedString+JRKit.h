//
//  NSMutableAttributedString+JRKit.h
//  JayRKit
//
//  Created by 孙志雄 on 2023/8/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (JRKit)

- (void)addTextColorArt:(UIColor *)color range:(NSRange)range;

- (void)addBackgroundColorArt:(UIColor *)color range:(NSRange)range;

- (void)addFontArt:(UIFont *)font range:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
