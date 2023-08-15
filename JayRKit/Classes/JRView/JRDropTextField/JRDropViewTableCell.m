//
//  JRDropViewTableCell.m
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/15.
//

#import "JRDropViewTableCell.h"

@implementation JRDropViewTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.resultLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).inset(5);
        make.right.equalTo(self);
        make.top.bottom.equalTo(self);
    }];
}


- (JRLabel *)resultLabel{
    if(!_resultLabel){
        _resultLabel = [[JRLabel alloc] init];
        _resultLabel.textColor = [UIColor grayColor];
    }
    return _resultLabel;
}

@end
