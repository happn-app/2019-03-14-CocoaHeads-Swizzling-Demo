/*
 * HPNSimpleObject_H.h
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/2/20.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

@import Foundation;



NS_ASSUME_NONNULL_BEGIN

@interface HPNSimpleObjectRoot_H : NSObject {
}

- (void)printHello1;
- (void)printHello2;
- (void)printHello3;

@end


@interface HPNSimpleObjectChild1_H : HPNSimpleObjectRoot_H {
}

@end


@interface HPNSimpleObjectChild2_H : HPNSimpleObjectChild1_H {
}

@end


@interface HPNSimpleObjectChild3_H : HPNSimpleObjectChild2_H {
}

@end


void hpnSwizzleHello3(void);

NS_ASSUME_NONNULL_END
