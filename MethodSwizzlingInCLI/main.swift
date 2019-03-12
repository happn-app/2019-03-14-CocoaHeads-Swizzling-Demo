/*
 * main.swift
 * ObjCRuntimeFun
 *
 * Created by François Lamboley on 2019/2/19.
 * Copyright © 2019 Frizlab. All rights reserved.
 */

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
