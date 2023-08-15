//
//  NSMutableAttributedString+JRKit.m
//  JayRKit
//
//  Created by 孙志雄 on 2023/8/15.
//

#import "NSMutableAttributedString+JRKit.h"
#import "JRMacro.h"

@implementation NSMutableAttributedString (JRKit)


JR_DYNAMIC_PROPERTY_OBJECT_Implementation(JRAttibutesDict,setJRAttibutesDict,RETAIN,NSMutableDictionary *);

- (void)addBackgroundColorArt:(UIColor *)color range:(NSRange)range{
//    NSMutableDictionary *dict = [self JRAttibutesDict];
//    if(dict[NSBackgroundColorAttributeName]){
//        [self removeAttribute:@{NSBackgroundColorAttributeName:(UIColor *)dict[NSBackgroundColorAttributeName]} range:range];
//        [dict setValue:color forKey:NSBackgroundColorAttributeName];
//        [self addAttributes:@{NSBackgroundColorAttributeName:color} range:range];
//    }else{
//        [dict setObject:color forKey:NSBackgroundColorAttributeName];
//        [self addAttributes:@{NSBackgroundColorAttributeName:color} range:range];
//    }
//    [self setJRAttibutesDict:dict];
    [self addAttribute:NSBackgroundColorAttributeName value:color range:range];
}

- (void)addTextColorArt:(UIColor *)color range:(NSRange)range{
//    NSMutableDictionary *dict = [self JRAttibutesDict];
//    if(dict[NSForegroundColorAttributeName]){
//        [self removeAttribute:@{NSForegroundColorAttributeName:(UIColor *)dict[NSForegroundColorAttributeName]} range:range];
//        [dict setValue:color forKey:NSForegroundColorAttributeName];
//        [self addAttributes:@{NSForegroundColorAttributeName:color} range:range];
//    }else{
//        [dict setObject:color forKey:NSForegroundColorAttributeName];
//        [self addAttributes:@{NSForegroundColorAttributeName:color} range:range];;
//    }
//    [self setJRAttibutesDict:dict];
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

- (void)addFontArt:(UIFont *)font range:(NSRange)range{
//    NSMutableDictionary *dict = [self JRAttibutesDict];
//    if(dict[NSFontAttributeName]){
//        [self removeAttribute:@{NSFontAttributeName:(UIFont *)dict[NSFontAttributeName]} range:range];
//        [dict setValue:font forKey:NSFontAttributeName];
//        [self addAttributes:@{NSFontAttributeName:font} range:range];
//    }else{
//        [dict setObject:font forKey:NSFontAttributeName];
//        [self addAttributes:@{NSFontAttributeName:font} range:range];
//    }
//    [self setJRAttibutesDict:dict];
    [self addAttribute:NSFontAttributeName value:font range:range];
}



@end
