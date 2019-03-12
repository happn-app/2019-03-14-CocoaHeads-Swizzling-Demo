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

#import "HPNSimpleObject_H.h"

@import Foundation;

@import HPNSwizzling;



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
