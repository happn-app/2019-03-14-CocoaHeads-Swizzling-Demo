/*
 * HPNSimpleObject_J.m
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/2/20.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

#import "HPNSimpleObject_J.h"

@import Foundation;

#import "JRSwizzle.h"



@implementation HPNSimpleObjectRoot_J

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


@implementation HPNSimpleObjectChild1_J

@end


@implementation HPNSimpleObjectChild2_J

@end


@implementation HPNSimpleObjectChild3_J

@end



@implementation HPNSimpleObjectChild2_J (JRSwizzle)

- (void)hpn2_printHello3
{
	NSLog(@"Hello3, from Swizzling in child 2.");
	[self hpn2_printHello3];
}

@end


@implementation HPNSimpleObjectChild1_J (JRSwizzle)

- (void)hpn1_printHello3
{
	NSLog(@"Hello3, from Swizzling in child 1.");
	[self hpn1_printHello3];
}

@end


void jrSwizzleHello3(void) {
	[HPNSimpleObjectChild2_J jr_swizzleMethod:@selector(printHello3) withMethod:@selector(hpn2_printHello3) error:NULL];
	[HPNSimpleObjectChild1_J jr_swizzleMethod:@selector(printHello3) withMethod:@selector(hpn1_printHello3) error:NULL];
}
