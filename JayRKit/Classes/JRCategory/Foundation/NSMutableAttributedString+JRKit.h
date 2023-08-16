//
//  NSMutableAttributedString+JRKit.h
//  JayRKit
//
//  Created by 孙志雄 on 2023/8/15.
//

#import <Foundation/Foundation.h>
#import "JRMacro.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (JRKit)

JR_PROPERTY_Interface(attributedDict,setAttributedDict,NSMutableDictionary *);

- (void)addTextColorArt:(UIColor *)color range:(NSRange)range;

- (void)addBackgroundColorArt:(UIColor *)color range:(NSRange)range;

- (void)addFontArt:(UIFont *)font range:(NSRange)range;


@end

NS_ASSUME_NONNULL_END
