/*
 * HPNSimpleObject.h
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/2/20.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

@import Foundation;



NS_ASSUME_NONNULL_BEGIN

@interface HPNSimpleObjectRoot_M : NSObject {
}

- (void)printHello1;
- (void)printHello2;
- (void)printHello3;

@end


@interface HPNSimpleObjectChild1_M : HPNSimpleObjectRoot_M {
}

@end


@interface HPNSimpleObjectChild2_M : HPNSimpleObjectChild1_M {
}

@end


@interface HPNSimpleObjectChild3_M : HPNSimpleObjectChild2_M {
}

@end


void manualSwizzleHello3(void);

NS_ASSUME_NONNULL_END
