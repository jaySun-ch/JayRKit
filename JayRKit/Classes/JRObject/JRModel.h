//
//  JRModel.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/11.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRModel : NSObject<NSCopying,NSCoding>
- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)error;

- (instancetype)initWithData:(NSData *)data error:(NSError *__autoreleasing *)error;

@end


