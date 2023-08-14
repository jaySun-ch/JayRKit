//
//  JRViewController.m
//  JayRKit
//
//  Created by jaySun-ch on 07/27/2023.
//  Copyright (c) 2023 jaySun-ch. All rights reserved.
//

#import "JRViewController.h"
#import "JayRKit.h"

// 这是一个创建新类的宏定义
JRCreateModel(JRHomeConfig,
                 JRCreatePropertyWithArgs(strong,NSDictionary* ,moduleA);
                 JRCreatePropertyWithArgs(strong,NSString *,moduleB);
                );


@interface JRViewController ()

@end

@implementation JRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    JRFillVerifyCodeView *codeView = [[JRFillVerifyCodeView alloc] initWithCodeNumberLength:6 style:JRVerifyCodeInputCircle];
    codeView.origin = CGPointMake(0,100);
    [self addSubView:codeView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
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


@end

//
//NSDictionary *dict = @{
//    @"NSString":@"name",
//    @"NSInteger":@"age",
//    @"NSArray":@"bad"
//};
//
//Class klass = [self class];
//for (NSString *typeString in dict.allKeys) {
//  NSString *propertyName = dict[typeString];
//  const char *typeEncoding = [typeString UTF8String];
//  objc_property_attribute_t type = {typeEncoding, "@"};
//  class_addProperty(klass, propertyName.UTF8String,&type,1);
//  NSString *getterSelName = [NSString stringWithFormat:@"_%@", propertyName];
//  SEL getterSel = NSSelectorFromString(getterSelName);
//  NSString *setterSelName = [NSString stringWithFormat:@"set%@:", [propertyName capitalizedString]];
//  SEL setterSel = NSSelectorFromString(setterSelName);
//  IMP getterImp = imp_implementationWithBlock(^(id self) {
//     return self;
//  });
// IMP setterImp = imp_implementationWithBlock(^(id self, id newValue) {
//     self = newValue;
//  });
//  class_addMethod(klass, getterSel, getterImp, "@@:");
//  class_addMethod(klass, setterSel, setterImp, "v@:@");
//};
//
//NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
//// 将文件数据化
//NSError * error=nil;
//NSString *jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
////josn字符串转字典
//NSDictionary *testDic = [self dictionaryWithJsonString:jsonString];
//UIButton *testButton = [[UIButton alloc] initWithAction:^(JRTarget * _Nonnull sender) {
//    NSLog(@"good");
//} event:UIControlEventTouchUpInside];
//testButton.frame = CGRectMake(100,100,100,100);
//[testButton setTitle:@"hello" forState:UIControlStateNormal];
//[self addSubView:testButton];
