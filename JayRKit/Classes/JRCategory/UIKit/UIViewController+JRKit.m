//
//  UIViewController+JRKit.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "UIViewController+JRKit.h"
#import "UIView+JRKit.h"
#import "JRMacro.h"
#import "JRDefine.h"

#define JRVC_CreatePROPERTY(setter,getter) \
- (UIColor *)setter{ \
    return self.view.setter; \
}\
- (void)set##getter:(UIColor *)setter{\
    self.view.setter = setter;\
}\

@implementation UIViewController (JRKit)

JRVC_CreatePROPERTY(backgroundColor,BackgroundColor);

- (CGRect)bounds{
    return self.view.bounds;
}

@end


@implementation UIViewController (JRMethodExtension)

- (void)addSubView:(UIView *)subView{
    [self.view addSubview:subView];
}

- (void)removeAllSubViews{
    [self.view removeAllSubViews];
}

@end

@implementation UIViewController (JRPopViewController)


- (void)jr_presentPopViewController:(JRPopViewController *)vc{
    [self jr_presentPopViewController:vc animated:YES completion:^{
        
    }];
}


- (void)jr_presentPopViewController:(JRPopViewController *)vc animated:(BOOL)animated completion:(void (^)(void))completion{
    if(![vc conformsToProtocol:@protocol(JRPopPresentable)]){
        NSAssert(0,@"view controller is not conforms JRPopPresentable protocol");
    }
    JRPopViewController<JRPopPresentable> *newVc = (JRPopViewController<JRPopPresentable> *)vc;
    newVc.view.frame = CGRectMake(0,JRScreenHeight - newVc.popViewHeight,JRScreenWidth,newVc.popViewHeight);
    UIView *continaerView ;
    if(newVc.isShowTapBackground){
        continaerView = [[UIView alloc] initWithFrame:self.bounds];
        continaerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        continaerView.alpha = 0;
        [self addSubView:continaerView];
        [continaerView addSubview:newVc.view];
    }else{
        [self addSubView:newVc.view];
    }

    newVc.view.transform = CGAffineTransformMakeTranslation(0,newVc.popViewHeight);
    
    if(newVc.isAllowScrollToDimiss){
        /// 
    }
    
    if(!JRShadowSettingIsNull(newVc.viewShadowSetting)){
        [newVc.view addShadowViewWithCornerRadius:newVc.viewCornerRadius shadowSetting:newVc.viewShadowSetting];
    }
    
    if(newVc.popAnimateStyle == JRPopTransAnimateDefault){
        [UIView animateWithDuration:0.4f animations:^{
            if(newVc.isShowTapBackground){
                continaerView.alpha = 1;
            }
            newVc.view.transform = CGAffineTransformIdentity;
        }];
    }else{
        [UIView animateWithDuration:0.65f
                              delay:0.0f
             usingSpringWithDamping:0.8f
              initialSpringVelocity:0.5f
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
            if(newVc.isShowTapBackground){
                continaerView.alpha = 1;
            }
            newVc.view.transform = CGAffineTransformIdentity;
        } completion:nil];
    }

    
    if(newVc.isAllowTapBackgroundDismiss && newVc.isShowTapBackground){
        @weakify(continaerView);
        [continaerView addTapAction:^(JRTarget * _Nonnull sender) {
            if(newVc.popAnimateStyle == JRPopTransAnimateDefault){
                [UIView animateWithDuration:0.4f animations:^{
                    weak_continaerView.alpha = 0;
                    newVc.view.transform = CGAffineTransformMakeTranslation(0,newVc.popViewHeight);
                }completion:^(BOOL finished) {
                    [weak_continaerView removeFromSuperview];
                    [newVc.view removeFromSuperview];
                }];
            }else{
                [UIView animateWithDuration:0.65f
                                      delay:0.0f
                     usingSpringWithDamping:0.8f
                      initialSpringVelocity:0.5f
                                    options:UIViewAnimationOptionCurveLinear
                                 animations:^{
                    weak_continaerView.alpha = 0;
                    newVc.view.transform = CGAffineTransformMakeTranslation(0,newVc.popViewHeight);
                } completion:^(BOOL finished) {
                    [weak_continaerView removeFromSuperview];
                    [newVc.view removeFromSuperview];
                }];
            }
       
        }];
    }
}



@end


