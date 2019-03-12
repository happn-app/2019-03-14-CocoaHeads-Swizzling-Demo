/*
 * HPNSimpleObject+ManualSwizzle.m
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/2/20.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

#import "HPNSimpleObject+ManualSwizzle.h"

#import "ManualSwizzle.h"



@implementation HPNSimpleObjectRoot_M (ManualSwizzle)

+ (void)load
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSLog(@"Manual Swizzling in root");
		manualSwizzle([self class], @selector(printHello1), @selector(hpn_printHello1));
	});
}

- (void)hpn_printHello1
{
	NSLog(@"Hello1, from Swizzling in root.");
	[self hpn_printHello1];
}

@end



@implementation HPNSimpleObjectChild1_M (ManualSwizzle)

+ (void)load
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSLog(@"Manual Swizzling in child 1");
		manualSwizzle([self class], @selector(printHello2), @selector(hpn1_printHello2));
	});
}

- (void)hpn1_printHello2
{
	NSLog(@"Hello2, from Swizzling in child 1.");
	[self hpn1_printHello2];
}

@end



@implementation HPNSimpleObjectChild2_M (ManualSwizzle)

+ (void)load
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSLog(@"Manual Swizzling in child 2");
		manualSwizzle([self class], @selector(printHello2), @selector(hpn2_printHello2));
	});
}

- (void)hpn2_printHello2
{
	NSLog(@"Hello2, from Swizzling in child 2.");
	[self hpn2_printHello2];
}

@end
