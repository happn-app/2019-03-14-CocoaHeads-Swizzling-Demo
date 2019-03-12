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

#import "UIView+Swizzling.h"

@import HPNSwizzling;

#import "ManualSwizzle.h"
#import "JRSwizzle.h"



/* 0: Manual
 * 1: JR
 * 2: happn */
#define SWIZZLING_STYLE 2


@implementation UIView (Swizzling)

#if SWIZZLING_STYLE == 0
/* Manual Swizzling */

+ (void)load
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSLog(@"Manual Swizzling UIView");
		manualSwizzle([self class], @selector(touchesBegan:withEvent:), @selector(myTouchesBegan:withEvent:));
	});
}

- (void)myTouchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	NSLog(@"In myTouchesBegan:withEvent:");
	[self myTouchesBegan:touches withEvent:event];
}


#elif SWIZZLING_STYLE == 1
/* JR Swizzling */

+ (void)load
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSLog(@"JR Swizzling UIView");
		[self jr_swizzleMethod:@selector(touchesBegan:withEvent:) withMethod:@selector(myTouchesBegan:withEvent:) error:NULL];
	});
}

- (void)myTouchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	NSLog(@"In myTouchesBegan:withEvent:");
	[self myTouchesBegan:touches withEvent:event];
}


#elif SWIZZLING_STYLE == 2
/* happn Swizzling */

static void MyTouchesBeganWithEvent(id self, SEL _cmd, NSSet<UITouch *> *touches, UIEvent *event);
static void (*OriginalTouchesBeganWithEvent)(id self, SEL _cmd, NSSet<UITouch *> *touches, UIEvent *event);

static void MyTouchesBeganWithEvent(id self, SEL _cmd, NSSet<UITouch *> *touches, UIEvent *event) {
	NSLog(@"In MyTouchesBeganWithEvent");
	OriginalTouchesBeganWithEvent(self, _cmd, touches, event);
}

+ (void)load
{
	CHECKED_SWIZZLE([UIView class], touchesBegan:withEvent:, MyTouchesBeganWithEvent, OriginalTouchesBeganWithEvent);
}


#endif

@end
