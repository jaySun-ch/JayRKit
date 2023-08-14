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

- (void)viewDidLoad{
    [super viewDidLoad];
    // 在这里 我接收到了一个Json文件 现在根据这个json文件需要一个新类 我希望去调用上面的宏定义 但是直接调用会出现问题
    // 因为这是一个全局定义 不可以在非全局环境中执行
    // 因此我希望能够在这里将代码执行块抛出到全局环境中执行
    // 这里有什么办法能够解决吗
}

@end

//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    NSDictionary *dict = @{
//        @"NSString":@"name",
//        @"NSInteger":@"age",
//        @"NSArray":@"bad"
//    };
//
//    Class klass = [self class];
//    for (NSString *typeString in dict.allKeys) {
//      NSString *propertyName = dict[typeString];
//      const char *typeEncoding = [typeString UTF8String];
//      objc_property_attribute_t type = {typeEncoding, "@"};
//      class_addProperty(klass, propertyName.UTF8String,&type,1);
//      NSString *getterSelName = [NSString stringWithFormat:@"_%@", propertyName];
//      SEL getterSel = NSSelectorFromString(getterSelName);
//      NSString *setterSelName = [NSString stringWithFormat:@"set%@:", [propertyName capitalizedString]];
//      SEL setterSel = NSSelectorFromString(setterSelName);
//      IMP getterImp = imp_implementationWithBlock(^(id self) {
//         return self;
//      });
//     IMP setterImp = imp_implementationWithBlock(^(id self, id newValue) {
//         self = newValue;
//      });
//      class_addMethod(klass, getterSel, getterImp, "@@:");
//      class_addMethod(klass, setterSel, setterImp, "v@:@");
//    };
//
//    [self printObjectProperties];
//
//    Person *person = [Person new];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
//    // 将文件数据化
//    NSError * error=nil;
//    NSString *jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
//    //josn字符串转字典
//    NSDictionary *testDic = [self dictionaryWithJsonString:jsonString];
//
//    NSLog(@"%@ NSDictionary",testDic);
//
//
//
//    person.name = @"hello";
//    person.ban = @"good";
//    person.age = 100;
//
//
//    UIButton *testButton = [[UIButton alloc] initWithAction:^(JRTarget * _Nonnull sender) {
//        NSLog(@"good");
//    } event:UIControlEventTouchUpInside];
//    testButton.frame = CGRectMake(100,100,100,100);
//    [testButton setTitle:@"hello" forState:UIControlStateNormal];
//    [self addSubView:testButton];
//}
//
//
//- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
//{
//    if (jsonString == nil) {
//        return nil;
//    }
//    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *err;
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
//    if (err) {
//        NSLog(@"json解析失败：%@",err);
//        return nil;
//    }
//    return dic;
//}
