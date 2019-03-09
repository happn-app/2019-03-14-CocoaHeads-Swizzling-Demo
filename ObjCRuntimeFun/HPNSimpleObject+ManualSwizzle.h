/*
 * HPNSimpleObject+ManualSwizzle.h
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/2/20.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

#import "HPNSimpleObject_M.h"



NS_ASSUME_NONNULL_BEGIN

void manualSwizzle(Class class, SEL originalSelector, SEL swizzledSelector);

@interface HPNSimpleObjectRoot_M (ManualSwizzle)
@end

@interface HPNSimpleObjectChild1_M (ManualSwizzle)
@end

@interface HPNSimpleObjectChild2_M (ManualSwizzle)
@end

NS_ASSUME_NONNULL_END
