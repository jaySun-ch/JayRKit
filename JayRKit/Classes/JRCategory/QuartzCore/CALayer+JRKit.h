//
//  CALayer+JRKit.h
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/15.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (JRKit)

/// the origin for view
@property (nonatomic) CGPoint origin;
/// the origin.x for view
@property (nonatomic) CGFloat x;
/// the origin.y for view
@property (nonatomic) CGFloat y;
/// the left for view
@property (nonatomic) CGFloat left;
/// the right for view
@property (nonatomic) CGFloat right;
/// the bottom for view
@property (nonatomic) CGFloat bottom;
/// the top for view
@property (nonatomic) CGFloat top;
/// the size for view
@property (nonatomic) CGSize size;
/// the height for view
@property (nonatomic) CGFloat height;
/// the width for view
@property (nonatomic) CGFloat width;

@end

NS_ASSUME_NONNULL_END
