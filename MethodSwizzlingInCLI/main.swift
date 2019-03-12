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



NSLog("Let the show begin!")

NSLog("")
NSLog("************************************")
NSLog("********* Manual Swizzling *********")
NSLog("************************************")
NSLog("")
do {
	NSLog("********* Asking to print Hello1 *********")
	NSLog("*********    From Root")
	let objectRoot = HPNSimpleObjectRoot_M()
	objectRoot.printHello1()
	NSLog("*********    From Child1")
	let objectChild1 = HPNSimpleObjectChild1_M()
	objectChild1.printHello1()
	NSLog("*********    From Child2")
	let objectChild2 = HPNSimpleObjectChild2_M()
	objectChild2.printHello1()
}
NSLog("")
do {
	NSLog("********* Asking to print Hello2 *********")
	NSLog("*********    From Root")
	let objectRoot = HPNSimpleObjectRoot_M()
	objectRoot.printHello2()
	NSLog("*********    From Child1")
	let objectChild1 = HPNSimpleObjectChild1_M()
	objectChild1.printHello2()
	NSLog("*********    From Child2")
	let objectChild2 = HPNSimpleObjectChild2_M()
	objectChild2.printHello2()
}
NSLog("")
do {
	NSLog("********* Swizzling Hello3 *********")
	manualSwizzleHello3()
	NSLog("********* Asking to print Hello3 *********")
	NSLog("*********    From Root")
	let objectRoot = HPNSimpleObjectRoot_M()
	objectRoot.printHello3()
	NSLog("*********    From Child1")
	let objectChild1 = HPNSimpleObjectChild1_M()
	objectChild1.printHello3()
	NSLog("*********    From Child2")
	let objectChild2 = HPNSimpleObjectChild2_M()
	objectChild2.printHello3()
}
NSLog("")
NSLog("********************************")
NSLog("********* JR Swizzling *********")
NSLog("********************************")
NSLog("")
do {
	NSLog("********* Swizzling Hello3 *********")
	jrSwizzleHello3()
	NSLog("********* Asking to print Hello3 *********")
	NSLog("*********    From Root")
	let objectRoot = HPNSimpleObjectRoot_J()
	objectRoot.printHello3()
	NSLog("*********    From Child1")
	let objectChild1 = HPNSimpleObjectChild1_J()
	objectChild1.printHello3()
	NSLog("*********    From Child2")
	let objectChild2 = HPNSimpleObjectChild2_J()
	objectChild2.printHello3()
}
NSLog("")
NSLog("*********************************")
NSLog("********* HPN Swizzling *********")
NSLog("*********************************")
NSLog("")
do {
	NSLog("********* Swizzling Hello3 *********")
	hpnSwizzleHello3()
	NSLog("********* Asking to print Hello3 *********")
	NSLog("*********    From Root")
	let objectRoot = HPNSimpleObjectRoot_H()
	objectRoot.printHello3()
	NSLog("*********    From Child1")
	let objectChild1 = HPNSimpleObjectChild1_H()
	objectChild1.printHello3()
	NSLog("*********    From Child2")
	let objectChild2 = HPNSimpleObjectChild2_H()
	objectChild2.printHello3()
}
