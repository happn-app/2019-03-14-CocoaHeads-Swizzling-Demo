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

#import "HPNObjectHelptender.h"

@import eXtenderZ.HelptenderUtils;



@implementation HPNObjectHelptender

+ (void)load
{
	[self hpn_registerClass:self asHelptenderForProtocol:@protocol(HPNObjectExtender)];
}

+ (void)hpn_helptenderHasBeenAdded:(NSObject <HPNHelptender> *)helptender
{
#pragma unused(helptender)
	/* Nothing do to here */
}

+ (void)hpn_helptenderWillBeRemoved:(NSObject <HPNHelptender> *)helptender
{
#pragma unused(helptender)
	/* Nothing do to here */
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
	for (id <HPNObjectExtender> extender in [self hpn_extendersConformingToProtocol:@protocol(HPNObjectExtender)]) {
		id o = [extender forwardObjectForUnknownSelector:aSelector of:self];
		if (o != nil) {return o;}
	}
	return ((id (*)(id, SEL, SEL))HPN_HELPTENDER_CALL_SUPER(HPNObjectHelptender, aSelector));
}

@end
