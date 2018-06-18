//
//  main.swift
//  Tests
//
//  Created by Gowtham Kudupudi on 17/06/18.
//  Copyright © 2018 ferryfair. All rights reserved.
//

import Foundation
@testable import SwiftTest
   
var TestStart : UInt64
var TestEnd : UInt64
var Diff : UInt64
var SuiteStart : UInt64
var SuiteEnd : UInt64

var Info = mach_timebase_info()
guard mach_timebase_info(&Info) == KERN_SUCCESS else { 
   print("couldn't fetch mach_timebase_info"); exit(-1) 
}
var RTFactor = UInt64(Info.numer)/UInt64(Info.denom)
let NF = NumberFormatter()
NF.numberStyle = NumberFormatter.Style.decimal
NF.maximumFractionDigits = 9
func sysNS_to_absS_str (_ ns:UInt64) -> String {
   return NF.string(for: Double(ns*RTFactor)/1000000000)!
}

SuiteStart = mach_absolute_time()

print("%SUITE_STARTED% testSwift\n")

var f:UInt = 0
print("%TEST_STARTED% factorial")
TestStart =  mach_absolute_time()
   f = factorial(15)
TestEnd = mach_absolute_time()
print("factorial(15):", f)
Diff = TestEnd - TestStart;
print("%TEST_FINISHED% time:", sysNS_to_absS_str(Diff), "factorial\n")

print("%TEST_STARTED% factorial_by_loop")
TestStart =  mach_absolute_time()
   f = factorial_by_loop(15)
TestEnd = mach_absolute_time()
print("factorial_by_loop(15):", f)
Diff = TestEnd - TestStart;
print("%TEST_FINISHED% time:", sysNS_to_absS_str(Diff), 
   "factorial_by_loop\n")

print("%TEST_STARTED% fibonacci")
TestStart =  mach_absolute_time()
   f = fibonacci(15)
TestEnd = mach_absolute_time()
print("fibonacci(15):", fibonacci(15))
Diff = TestEnd - TestStart;
print("%TEST_FINISHED% time:", sysNS_to_absS_str(Diff), "fibonacci\n")

print("%TEST_STARTED% fibonacci_by_loop")
TestStart =  mach_absolute_time()
   f = fibonacci_by_loop(15)
TestEnd = mach_absolute_time()
print("fibonacci_by_loop(15):", f)
Diff = TestEnd - TestStart;
print("%TEST_FINISHED% time:", sysNS_to_absS_str(Diff), 
   "fibonacci_by_loop\n")

print("%TEST_STARTED% ClassNStruct")
TestStart =  mach_absolute_time();
print("{")
print("\tInt size:",    MemoryLayout<Int>.size)
print("\tFloat size:",  MemoryLayout<Float>.size)
print("\tUInt16 size:", MemoryLayout<UInt16>.size)
print("\tCChar size:",  MemoryLayout<CChar>.size)
print("}")
print("Class size:",    MemoryLayout<ClassEG_>.size)
print("Struct size:",   MemoryLayout<StructEG_>.size)
TestEnd =  mach_absolute_time()
Diff = TestEnd - TestStart;
print("%TEST_FINISHED% time:", sysNS_to_absS_str(Diff), "ClassNStruct\n")

SuiteEnd =  mach_absolute_time()
Diff = SuiteEnd - SuiteStart;
print("%SUITE_FINISHED% time:", sysNS_to_absS_str(Diff))
