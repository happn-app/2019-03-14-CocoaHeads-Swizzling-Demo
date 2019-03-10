/*
 * ManualSwizzle.h
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/3/10.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

@import Foundation;



void manualSwizzle(Class class, SEL originalSelector, SEL swizzledSelector);
