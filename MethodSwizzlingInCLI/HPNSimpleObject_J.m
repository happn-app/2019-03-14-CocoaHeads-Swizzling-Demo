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
