/*
 * HPNSimpleObject_H.m
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/2/20.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

#import "HPNSimpleObject_H.h"

@import Foundation;

#import "NSObject+HPNSwizzling.h"



@implementation HPNSimpleObjectRoot_H

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


@implementation HPNSimpleObjectChild1_H

@end


@implementation HPNSimpleObjectChild2_H

@end


@implementation HPNSimpleObjectChild3_H

@end


static void MyChild2PrintHello3(id self, SEL _cmd);
static void (*OriginalChild2PrintHello3)(id self, SEL _cmd);

static void MyChild2PrintHello3(id self, SEL _cmd) {
	NSLog(@"Hello3, from Swizzling in child 2.");
	OriginalChild2PrintHello3(self, _cmd);
}


static void MyChild1PrintHello3(id self, SEL _cmd);
static void (*OriginalChild1PrintHello3)(id self, SEL _cmd);

static void MyChild1PrintHello3(id self, SEL _cmd) {
	NSLog(@"Hello3, from Swizzling in child 1.");
	OriginalChild1PrintHello3(self, _cmd);
}

void hpnSwizzleHello3(void) {
	CHECKED_SWIZZLE([HPNSimpleObjectChild2_H class], printHello3, MyChild2PrintHello3, OriginalChild2PrintHello3);
	CHECKED_SWIZZLE([HPNSimpleObjectChild1_H class], printHello3, MyChild1PrintHello3, OriginalChild1PrintHello3);
}
