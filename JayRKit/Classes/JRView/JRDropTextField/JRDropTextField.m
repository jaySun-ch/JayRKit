//
//  JRDropTextField.m
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/15.
//

#import "JRDropTextField.h"
#import "JRDropViewTableCell.h"
#import "JRMacro.h"
#import "UIView+JRKit.h"


@interface JRDropTextField()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@end

@implementation JRDropTextField

#pragma mark - life cycle

- (instancetype)init{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.dropView];
        self.animateStyle = JRDropTextFieldAnimateFold;
        JRShadowSetting setting;
        setting.shadowColor = [UIColor grayColor];
        setting.shadowOpacity = 0.3;
        setting.shadowRadius = 5.0;
        setting.shadowOffset = CGSizeMake(0,5);
        self.dropView.frame = CGRectMake(10,60,self.width - 20,300);
        self.dropView.backgroundColor = [UIColor whiteColor];
        [self.dropView addShadowViewWithCornerRadius:5.0 shadowSetting:setting];
        [self.dropView.superview setHidden:YES];
        [self addSubview:self.textField];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.right.equalTo(self).inset(10);
        make.height.mas_equalTo(50);
    }];
}

#pragma mark - lazy load

JRCreateLazyLoad(UITextField *,textField,^{
    self.textField = [[UITextField alloc] init];
    self.textField.layer.borderWidth = 1.0;
    self.textField.borderStyle = UITextBorderStyleLine;
    self.textField.layer.borderColor = [UIColor redColor].CGColor;
    self.textField.delegate = self;
    self.textField.backgroundColor = [UIColor whiteColor];
});

JRCreateLazyLoad(UITableView *,dropView,^{
    self.dropView = [[UITableView alloc] init];
    self.dropView.delegate = self;
    self.dropView.dataSource = self;
    self.dropView.separatorStyle = UITableViewCellSeparatorStyleNone;
});

#pragma mark - tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.dropTextArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JRDropViewTableCell *cell = [tableView dequeueReusableCellWithIdentifier:JRDropViewTableCellID];
    if(!cell){
        cell = [[JRDropViewTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:JRDropViewTableCellID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.resultLabel.text = [self sortArrayWithRange][indexPath.row];
    [cell.resultLabel addTextHLWithColor:[UIColor purpleColor] range:[cell.resultLabel.text searchStrDim:self.textField.text]];
    return cell;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidChangeSelection:(UITextField *)textField{
    if(_delegate){
        [_delegate textFieldDidChangeSelection:textField];
    }
    [self changeDropViewState];
}

- (void)changeDropViewState{
    if(self.textField.text.length == 0 && !self.dropView.superview.isHidden){
        /// 消失
        [self dismissDropView];
    }
    
    if(self.textField.text.length != 0 && self.dropView.superview.isHidden){
        /// 显示
        [self showDropView];
    }
}
    
- (void)showDropView{
    switch (self.animateStyle) {
        case JRDropTextFieldAnimateNone:
            break;
        case JRDropTextFieldAnimateSlider:
            self.dropView.superview.transform = CGAffineTransformMakeTranslation(0,-self.textField.height);
            self.dropView.superview.alpha = 0;
            break;
        case JRDropTextFieldAnimateFold:
            self.dropView.superview.transform3D = CATransform3DMakeRotation(M_PI_4,1,1,0);
            self.dropView.superview.alpha = 0;
            break;
        case JRDropTextFieldAnimateFade:
            self.dropView.superview.alpha = 0;
            break;
        default:
            self.dropView.superview.alpha = 0;
            break;
    }
    [self.dropView.superview setHidden:NO];
    [UIView animateWithDuration:0.4f animations:^{
        self.dropView.superview.transform = CGAffineTransformIdentity;
        self.dropView.superview.alpha = 1;
        self.dropView.superview.transform3D = CATransform3DIdentity;
    }];
}

- (void)dismissDropView{
    [UIView animateWithDuration:0.4f animations:^{
        switch (self.animateStyle) {
            case JRDropTextFieldAnimateNone:
                break;
            case JRDropTextFieldAnimateSlider:
                self.dropView.superview.transform = CGAffineTransformMakeTranslation(0,-self.textField.height);
                self.dropView.superview.alpha = 0;
                break;
            case JRDropTextFieldAnimateFold:
                self.dropView.superview.transform3D = CATransform3DMakeRotation(M_PI_4,1,1,0);
                self.dropView.superview.alpha = 0;
                break;
            case JRDropTextFieldAnimateFade:
                self.dropView.superview.alpha = 0;
                break;
            default:
                self.dropView.superview.alpha = 0;
                break;
        }
    }completion:^(BOOL finished) {
        [self.dropView.superview setHidden:YES];
    }];
}

- (void)refreshView{
    [self.dropView reloadData];
}

#pragma mark - sortArry

- (NSArray *)sortArrayWithRange{
    return [self.datasource.dropTextArray sortedArrayUsingComparator:^NSComparisonResult(NSString*  _Nonnull obj1, NSString* _Nonnull obj2) {
        NSRange range1 = [obj1 searchStrDim:self.textField.text];
        NSRange range2 = [obj2 searchStrDim:self.textField.text];
        if(range1.location > range2.location){
            return NSOrderedDescending;
        }else if(range1.location == range2.location){
            if(range1.length > range2.length){
                return NSOrderedDescending;
            }else if(range1.length == range2.length){
                return NSOrderedSame;
            }else{
                return NSOrderedAscending;
            }
        }else{
            /// 小的
            return  NSOrderedAscending;
        }
    }];
}


@end
