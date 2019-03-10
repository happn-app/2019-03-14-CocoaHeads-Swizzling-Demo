/*
 * HPNSimpleObject_M.m
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/2/20.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

#import "HPNSimpleObject_M.h"

@import Foundation;

#import "HPNSimpleObject+ManualSwizzle.h"



@implementation HPNSimpleObjectRoot_M

- (void)printHello1
{
	NSLog(@"Hello1 original implementation in root");
}

- (void)printHello2
{
	NSLog(@"Hello2 original implementation in root");
}

- (void)printHello3
{
	NSLog(@"Hello3 original implementation in root");
}

@end


@implementation HPNSimpleObjectChild1_M

@end


@implementation HPNSimpleObjectChild2_M

@end


@implementation HPNSimpleObjectChild3_M

@end



@implementation HPNSimpleObjectChild2_M (ManualSwizzle)

- (void)hpn2_printHello3
{
	NSLog(@"Hello3, from Swizzling in child 2.");
	[self hpn2_printHello3];
}

@end


@implementation HPNSimpleObjectChild1_M (ManualSwizzle)

- (void)hpn1_printHello3
{
	NSLog(@"Hello3, from Swizzling in child 1.");
	[self hpn1_printHello3];
}

@end


void manualSwizzleHello3(void) {
	manualSwizzle([HPNSimpleObjectChild2_M class], @selector(printHello3), @selector(hpn2_printHello3));
	manualSwizzle([HPNSimpleObjectChild1_M class], @selector(printHello3), @selector(hpn1_printHello3));
}
