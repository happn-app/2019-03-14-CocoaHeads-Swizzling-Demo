/*
 * ManualSwizzle.m
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/3/10.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

#import "ManualSwizzle.h"

@import ObjectiveC.runtime;



void manualSwizzle(Class class, SEL originalSelector, SEL swizzledSelector) {
	/* From https://nshipster.com/method-swizzling/ */
	Method originalMethod = class_getInstanceMethod(class, originalSelector);
	Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
	
	BOOL didAddMethod =
	class_addMethod(class,
						 originalSelector,
						 method_getImplementation(swizzledMethod),
						 method_getTypeEncoding(swizzledMethod));
	
	if (didAddMethod) {
		class_replaceMethod(class,
								  swizzledSelector,
								  method_getImplementation(originalMethod),
								  method_getTypeEncoding(originalMethod));
	} else {
		method_exchangeImplementations(originalMethod, swizzledMethod);
	}
}
