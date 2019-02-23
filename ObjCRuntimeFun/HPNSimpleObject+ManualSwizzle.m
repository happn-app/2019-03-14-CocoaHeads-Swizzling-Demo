/*
 * HPNSimpleObject+ManualSwizzle.m
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/2/20.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

#import "HPNSimpleObject+ManualSwizzle.h"

@import ObjectiveC.runtime;



@implementation HPNSimpleObject (ManualSwizzle)
/* From https://nshipster.com/method-swizzling/ */

+ (void)load
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		Class class = [self class];
		
		SEL originalSelector = @selector(printHello1);
		SEL swizzledSelector = @selector(hpn_printHello1);
		
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
	});
}

- (void)hpn_printHello1
{
	NSLog(@"Will print Hello1, but first, doing my thing.");
	[self hpn_printHello1];
}

@end
