/*
 * UIView+Swizzling.m
 * SwizzleTest
 *
 * Created by François Lamboley on 2019/3/10.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

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
