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

#import "ManualSwizzle.h"

@import ObjectiveC.runtime;



void manualSwizzle(Class class, SEL originalSelector, SEL swizzledSelector) {
	/* From https://nshipster.com/method-swizzling/ */
	Method originalMethod = class_getInstanceMethod(class, originalSelector);
	Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
	
	BOOL didAddMethod =
	class_addMethod(class,
						 originalSelector,
						 method_getImplementation(swizzledMethod),
						 method_getTypeEncoding(swizzledMethod));
	
	if (didAddMethod) {
		class_replaceMethod(class,
								  swizzledSelector,
								  method_getImplementation(originalMethod),
								  method_getTypeEncoding(originalMethod));
	} else {
		method_exchangeImplementations(originalMethod, swizzledMethod);
	}
}
