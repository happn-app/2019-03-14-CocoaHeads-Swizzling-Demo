/*
 * HPNSimpleObject.m
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/2/20.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

#import "HPNSimpleObject_M.h"

@import Foundation;



@implementation HPNSimpleObjectRoot_M

- (void)printHello1
{
	NSLog(@"Hello1 original implementation in root");
}

- (void)printHello2
{
	NSLog(@"Hello2 original implementation in root");
}

@end


@implementation HPNSimpleObjectChild1_M

@end


@implementation HPNSimpleObjectChild2_M

@end
