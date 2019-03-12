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

#import "HPNScrollViewHelptender.h"

@import eXtenderZ.HelptenderUtils;



@implementation HPNScrollViewHelptender

+ (void)load
{
	[self hpn_registerClass:self asHelptenderForProtocol:@protocol(HPNScrollViewExtender)];
}

+ (void)hpn_helptenderHasBeenAdded:(nonnull NSObject<HPNHelptender> *)helptender
{
	/* Nothing to do */
}

+ (void)hpn_helptenderWillBeRemoved:(nonnull NSObject<HPNHelptender> *)helptender
{
	/* Nothing to do */
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
	BOOL ret = ((BOOL (*)(id, SEL, UIView *))HPN_HELPTENDER_CALL_SUPER(HPNScrollViewHelptender, view));
	
	for (id <HPNScrollViewExtender> extender in [self hpn_extendersConformingToProtocol:@protocol(HPNScrollViewExtender)])
		if ([extender respondsToSelector:@selector(scrollView:touchesShouldCancelInContentView:)])
			ret = ret || [extender scrollView:self touchesShouldCancelInContentView:view];
	
	return ret;
}

@end
