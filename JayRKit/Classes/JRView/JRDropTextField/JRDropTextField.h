//
//  JRDropTextField.h
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/15.
//

#ifndef JRDropTextField_h
#define JRDropTextField_h

@class JRDropTextField;

@protocol JRDropTextFieldDelegate <NSObject>

@optional
- (void)didSelectItemWithIndexPath:(NSIndexPath *)indexPath;

- (void)textFieldDidChangeSelection:(UITextField *)textField;

@end

@protocol JRDropTextFieldDataSource <NSObject>

@required
- (NSArray<NSString *> *)dropTextArray;

@end

typedef NSInteger JRDropTextFieldAnimateStyle;

NS_ENUM(JRDropTextFieldAnimateStyle){
    JRDropTextFieldAnimateNone = 1,
    JRDropTextFieldAnimateSlider,
    JRDropTextFieldAnimateFold,
    JRDropTextFieldAnimateFade
};

#import <UIKit/UIKit.h>
#import "JRTextField.h"

@interface JRDropTextField : UIView

@property (nonatomic,weak) id<JRDropTextFieldDelegate> delegate;

@property (nonatomic,weak) id<JRDropTextFieldDataSource> datasource;

@property (nonatomic,strong) JRTextField *textField;

@property (nonatomic,strong) UITableView *dropView;

@property (nonatomic,assign) JRDropTextFieldAnimateStyle animateStyle;

- (void)refreshView;

@end



#endif /* JRDropTextField_h */
