//
//  JRDropViewTableCell.h
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/15.
//

#ifndef JRDropViewTableCell_h
#define JRDropViewTableCell_h

static NSString *const JRDropViewTableCellID = @"JRDropViewTableCell";

#import <UIKit/UIKit.h>
#import "JRLabel.h"

@interface JRDropViewTableCell : UITableViewCell

@property (nonatomic,strong) JRLabel *resultLabel;


@end

#endif /* JRDropViewTableCell_h */
