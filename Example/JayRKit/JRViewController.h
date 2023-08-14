//
//  JRViewController.h
//  JayRKit
//
//  Created by jaySun-ch on 07/27/2023.
//  Copyright (c) 2023 jaySun-ch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


@interface JRViewController : UIViewController

@property (nonatomic,copy) NSString *classss;

@property (nonatomic,strong) NSDictionary<NSString*,NSString*> *array;

@property (nonatomic,assign) CGFloat floatsds;

@end
