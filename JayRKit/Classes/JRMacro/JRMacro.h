//
//  NSObject+JRJRMacro.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/7.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRModel.h"
#import <objc/runtime.h>

#ifndef JRMacro_h
#define JRMacro_h

#ifdef __cplusplus // 如果是 c++
#define JR_EXTERN_C_BEGIN extern "C"{ #define JR_EXTERN_C_END }
#else
#define JR_EXTERN_C_BEGIN
#define JR_EXTERN_C_END
#endif

JR_EXTERN_C_BEGIN

#ifndef JR_Middle
#define JR_Middle(_x_, _low_, _high_)  (((_x_) > (_high_)) ? (_high_) : (((_x_) < (_low_)) ? (_low_) : (_x_)))
#endif

#ifndef JR_Swap
#define JR_Swap(_a_,_b_) do{ \
__typeof__(_a_) _tmp_ = (_a_); \
(_a_) = (_b_); \
(_b_) = _tmp_;\
} while (0)
#endif

#ifndef JR_DUMMY_CLASS
#define JR_DUMMY_CLASS(_name_,_type_) \
@interface JR_DUMMY_CLASS_ ## _name_ : _type_ \
@end \
@implementation JR_DUMMY_CLASS_ ## _name_ : _type_ \
@end

#endif

#ifndef JR_DYNAMIC_PROPERTY_OBJECT
#define JR_DYNAMIC_PROPERTY_OBJECT(_getter_, _setter_, _association_, _type_) \
- (void)_setter_ : (_type_) object{ \
    [self willChangeValueForKey:@#_getter_];\
    objc_setAssociatedObject(self,_cmd,object,OBJC_ASSOCIATION_ ## _association_);\
    [self didChangeValueForKey:@#_getter_];\
}\
- (_type_)_getter_ {\
    return objc_getAssociatedObject(self,@selector(_setter_:));\
}
#endif

#ifndef JR_DYNAMIC_PROPERTY_CTYPE
#define JR_DYNAMIC_PROPERTY_CTYPE(_getter_, _setter_,_association_, _type_)\
- (void)_setter_ : (_type_)object{ \
    [self willChangeValueForKey:@#_getter_]; \
    NSValue *value = [NSValue value:&object withObjCType:@encode(_type_)]; \
    objc_setAssociatedObject(self,_cmd,value,OBJC_ASSOCIATION_RETAIN);\
    [self didChangeValueForKey:@#_getter_];\
}\
- (_type_)_getter_ { \
    _type_ cValue = { 0 }; \
    NSValue *value = objc_getAssociatedObject(self,@selector(_setter_:));\
    [value getValue:&cValue];\
    return cValue;\
}
#endif

#ifndef JRCreateModel
#define JRCreateModel(_name_,...) \
@interface  _name_ : JRModel \
__VA_ARGS__\
@end\
@implementation _name_ : JRModel \
@end
#endif

#ifndef JRCreatePropertyWithArgs
#define JRCreatePropertyWithArgs(propertyType,type,property_name) @property(nonatomic,propertyType) type property_name;
#endif

#ifndef JRCreateModelByJsonFile
#define JRCreateModelByJsonFile(_jsonDict_)
#endif

#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{}  __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {}  __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {}  __block __typeof__(object) block##_##object = object; 
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{ __weak __typeof__(object) object = weak##_##object;}
        #else
            #define strongify(object) autoreleasepool{ __block __typeof__(object) object = block##_##object;}
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{ __weak __typeof__(object) object = weak##_##object} @finally{} {}
        #else
            #define strongify(object) try{ __block __typeof__(object) object = block##_##object} @finally{} {}
        #endif
    #endif
#endif


#ifndef JRCreateLazyLoad
#define JRCreateLazyLoad(_type_,_name_,_block_) \
- (_type_)_name_{ \
    if(!_##_name_){ \
        _block_();\
    }\
    return _##_name_;\
}
#endif


static inline dispatch_time_t dispatch_time_delay(NSTimeInterval second){
    return dispatch_time(DISPATCH_WALLTIME_NOW,(int64_t)(second * NSEC_PER_SEC));
}






JR_EXTERN_C_END

#endif



