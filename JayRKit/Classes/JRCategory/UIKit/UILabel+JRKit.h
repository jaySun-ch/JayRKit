//
//  UILabel+JRKit.h
//  JayRKit
//
//  Created by 孙志雄 on 2023/8/15.
//

#import <UIKit/UIKit.h>
#import "NSMutableAttributedString+JRKit.h"
#import "NSString+JRKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (JRKit)

- (void)addTextHLWithColor:(UIColor *)hightlightColor range:(NSRange)range;

- (void)addBackgroundHLWithColor:(UIColor *)hightlightColor range:(NSRange)range;

- (void)addFontHLWithColor:(UIFont *)font range:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
