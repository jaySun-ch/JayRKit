//
//  CAPropertyAnimation+JRKit.h
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/15.
//

#import <QuartzCore/QuartzCore.h>


typedef NSString *CAAnimationKeyPathType;
static CAAnimationKeyPathType const CAAnimationKeyPathPostition = @"postition"; //位置 toValue:移动到制定位置 byValue:偏移制定距离
static CAAnimationKeyPathType const CAAnimationKeyPathTransX = @"transfomr.translation.x"; // 位移动画，沿x轴方向移动
static CAAnimationKeyPathType const CAAnimationKeyPathTransY = @"transfomr.translation.y";  // 位移动画，沿y轴方向移动
static CAAnimationKeyPathType const CAAnimationKeyPathTransZ = @" transfomr.translation.z"; // 位移动画，沿z轴方向移动
static CAAnimationKeyPathType const CAAnimationKeyPathScaleX = @"transform.scale.x"; // width缩放系数
static CAAnimationKeyPathType const CAAnimationKeyPathScaleY = @"transform.scale.y"; // height缩放系数
static CAAnimationKeyPathType const CAAnimationKeyPathScale = @"transform.scale";
static CAAnimationKeyPathType const CAAnimationKeyPathRotation = @"transform.rotation"; //旋转
static CAAnimationKeyPathType const CAAnimationKeyPathBackgroundColor = @"backgroundColor"; //颜色渐变
static CAAnimationKeyPathType const CAAnimationKeyPathBorderColor = @"borderColor";// 边框渐变色
static CAAnimationKeyPathType const CAAnimationKeyPathOpacity = @"opacity"; // 渐变色-淡入淡出
static CAAnimationKeyPathType const  CAAnimationKeyPathCornerRadius = @"cornerRadius"; // 圆角动画
static CAAnimationKeyPathType const CAAnimationKeyPathBorderWidth = @"borderWidth"; // 边框动画
static CAAnimationKeyPathType const CAAnimationKeyPathShadowOffset = @"shadowOffset"; //阴影渐变动画 CGSize
static CAAnimationKeyPathType const CAAnimationKeyPathStrokeEnd = @"strokeEnd"; // 划线

NS_ASSUME_NONNULL_BEGIN

@interface CAPropertyAnimation (JRKit)


+ (instancetype)animationWithKeyPathType:(CAAnimationKeyPathType)type;



@end

NS_ASSUME_NONNULL_END
