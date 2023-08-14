//
//  JRPath.h
//  JayRKit_Example
//
//  Created by sunzhixiong on 2023/8/14.
//  Copyright © 2023 jaySun-ch. All rights reserved.
//

#ifndef JRPath_h
#define JRPath_h

#import <Foundation/Foundation.h>

/** generate a squre path with width
 *  @param width the width for squre
 */
static inline CGPathRef JRSqurePath(CGFloat width){
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake(0, 0,width,width);
    CGPathAddRect(path, NULL, bounds);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    return path;
    CGPathRelease(path);
};


/** generate a rectAngle path with rectangleSize
 *  @param rectangleSize the size for rectAngle
 */
static inline CGPathRef JRRectangle(CGSize rectangleSize){
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake(0, 0,rectangleSize.width,rectangleSize.height);
    CGPathAddRect(path, NULL, bounds);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    return path;
    CGPathRelease(path);
};


/** generate a circle path with width and radius
 *  @param size the size for circle container
 *  @param radius the radius for circle
 */
static inline CGPathRef JRCircle(CGSize size,CGFloat radius){
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path,NULL,size.width / 2,size.height / 2,radius, 0, M_PI * 2, YES);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    return path;
    CGPathRelease(path);
}


#endif /* JRPath_h */
