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
