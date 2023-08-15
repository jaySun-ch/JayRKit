//
//  JRDefine.h
//  JayRKit
//
//  Created by sunzhixiong on 2023/8/14.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//


#ifndef JR_PROPERTY_Interface
#define JR_PROPERTY_Interface(getter,setter,type) \
- (void)setter:(type)object; \
- (type)getter;
#endif

#define JRScreenSize UIScreen.mainScreen.bounds.size

#define JRScreenWidth JRScreenSize.width

#define JRScreenHeight JRScreenSize.height




