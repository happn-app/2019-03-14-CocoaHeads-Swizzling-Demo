/*
Copyright 2019 happn

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. */

#import "HPNSimpleObject_M.h"

@import Foundation;

#import "ManualSwizzle.h"
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
