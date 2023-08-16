//
//  JRDetialViewControllerGroup.m
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/15.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import "JRDetialViewControllerGroup.h"


#define JRCreateDetialViewControllerImplementation(_name_,_type_,_origin_,_block_,...) \
@implementation _name_ \
- (void)viewDidLoad{ \
    [super viewDidLoad]; \
    self.backgroundColor = [UIColor whiteColor]; \
    [self addSubView:self.exampleView]; \
    self.exampleView.origin = _origin_; \
}\
JRCreateLazyLoad(_type_,exampleView,^{\
    @weakify(self); \
    _block_(weak_self);\
});\
__VA_ARGS__\
@end


JRCreateDetialViewControllerImplementation(
                                           JRVerifyCodeInputViewController,
                                           JRFillVerifyCodeView *,
                                           CGPointMake(0,100),
                                           ^(id weak_self){
    self.exampleView = [[JRFillVerifyCodeView alloc] initWithCodeNumberLength:6 style:JRVerifyCodeInputFillSquare];
    self.exampleView.delegate = weak_self;
},
- (void)didFinishFillVerifyCode:(NSString *)verifyCode{
    NSLog(@"%@",verifyCode);
});


JRCreateDetialViewControllerImplementation(
                                           JRDropTextFieldViewController,
                                           JRDropTextField *,
                                           CGPointMake(0,100),
                                           ^(id weak_self){
    self.exampleView = [[JRDropTextField alloc] initWithFrame:self.bounds];
    self.exampleView.delegate = weak_self;
    self.exampleView.datasource = weak_self;
},

JR_DYNAMIC_PROPERTY_OBJECT_Implementation(dropArray, setDropArray,RETAIN, NSMutableArray *);
                                           
- (void)textFieldDidChangeSelection:(UITextField *)textField{
    /// 修改内容
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    // 将文件数据化
    NSError * error=nil;
    NSString *jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    //josn字符串转字典
    NSDictionary *testDic = [self dictionaryWithJsonString:jsonString];
    NSString *key = [NSString stringWithFormat:@"%lu",textField.text.length];
    [self setDropArray:testDic[key]];
    [self.exampleView refreshView];
}
                                           
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
   if (jsonString == nil) {
       return nil;
   }
   NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
   NSError *err;
   NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
   if (err) {
       NSLog(@"json解析失败：%@",err);
       return nil;
   }
   return dic;
}
                                           
- (NSArray<NSString *> *)dropTextArray{
    return [self dropArray];
});


JRCreateDetialViewControllerImplementation(JRPopExampleViewController,
                                           UILabel *,
                                          CGPointMake(40,40),^(id weak_self){
    self.exampleView = [[UILabel alloc] init];
    self.exampleView.size = CGSizeMake(200,100);
    self.exampleView.text = @"这是一个实例";
},
- (CGFloat)popViewHeight{
    return 300;
}
- (CGFloat)viewCornerRadius{
    return 15;
}
- (BOOL)isAllowTapBackgroundDismiss{
    return YES;
}
- (JRShadowSetting)viewShadowSetting{
    return JRStandardShadow();
}
- (BOOL)isShowTapBackground{
    return YES;
}
- (JRPopTransAnimateStyle)popAnimateStyle{
    return JRPopTransAnimateSpring;
}
- (BOOL)isAllowScrollToDimiss{
    return YES;
}
                                           );

JRCreateDetialViewControllerImplementation(JRPopTestViewController,
                                           UIButton *,
                                          CGPointMake(0,100),^(id weak_self){
    self.exampleView = [[UIButton alloc] initWithAction:^(JRTarget * _Nonnull sender) {
        [self showPopView];
    } event:UIControlEventTouchUpInside];
    self.exampleView.size = CGSizeMake(200,100);
    [self.exampleView setTitle:@"点击弹出" forState:UIControlStateNormal];
    [self.exampleView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
},
- (void)showPopView{
    JRPopExampleViewController *vc = [[JRPopExampleViewController alloc] init];
    [self jr_presentPopViewController:vc];
}
                                           );


