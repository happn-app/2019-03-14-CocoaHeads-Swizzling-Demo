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

import Foundation
import ObjectiveC.runtime

import eXtenderZ



/* *** Standard isa-Swizzling *** */
do {
	let obj = HPNSimpleObject0()
	obj.printHello()
	
	object_setClass(obj, HPNSimpleObject1.self)
	obj.printHello()
}


/* *** Standard isa-Swizzling *** */
do {
	HPNUtils.objc_try({
		let obj = unsafeBitCast(NSObject(), to: NSNumber.self)
		
		let ext1 = ObjectExtender(forwardObject: NSNumber(value: 42))
		let ext2 = ObjectExtender(forwardObject: NSNumber(value: 21))
		
		HPNCheckedAddExtender(obj, ext1)
		let a1 = obj.decimalValue
		NSLog("%@", "yolo: \(a1)")
		
		HPNCheckedAddExtender(obj, ext2)
		let a2 = obj.decimalValue
		NSLog("%@", "yolo: \(a2)")
		
		obj.hpn_remove(ext1)
		let a3 = obj.decimalValue
		NSLog("%@", "yolo: \(a3)")
		
		obj.hpn_remove(ext2)
		HPNCheckedAddExtender(obj, ObjectExtender(forwardObject: NSNull()))
		let a4 = obj.decimalValue
		NSLog("%@", "yolo: \(a4)")
	}, catch: { e in
		NSLog("%@", "Got an exception: \(e)")
	})
}

NSLog("THE END")
