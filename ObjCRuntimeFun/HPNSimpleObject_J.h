/*
 * HPNSimpleObject_J.h
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/2/20.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

@import Foundation;



NS_ASSUME_NONNULL_BEGIN

@interface HPNSimpleObjectRoot_J : NSObject {
}

- (void)printHello1;
- (void)printHello2;
- (void)printHello3;

@end


@interface HPNSimpleObjectChild1_J : HPNSimpleObjectRoot_J {
}

@end


@interface HPNSimpleObjectChild2_J : HPNSimpleObjectChild1_J {
}

@end


@interface HPNSimpleObjectChild3_J : HPNSimpleObjectChild2_J {
}

@end


void jrSwizzleHello3(void);

NS_ASSUME_NONNULL_END
