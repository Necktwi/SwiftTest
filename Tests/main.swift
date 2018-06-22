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
NF.minimumIntegerDigits = 10
NF.groupingSeparator = ""
func sysNS_to_absS_str (_ ns:UInt64) -> String {
   return NF.string(for: Double(ns*RTFactor)/1000000000)!
}

let ResultsFile = "SwiftTestResults.txt"
let CDURL:URL = NSURL.fileURL(withPath: FileManager.default.currentDirectoryPath)
let FileURL = CDURL.appendingPathComponent(ResultsFile)
let FH = try! FileHandle(forWritingTo: FileURL)
FH.truncateFile(atOffset: 0)
func cf_log (_ items: Any...) {
   var str = ""
   for item in items {
      var tmp:String=""
      print(item, terminator:" ", to:&tmp)
      str.append(tmp)
   }
   str.removeLast()
   print(str)
   str.append("\n")
   FH.write(str.data(using: .utf8)!)
}

SuiteStart = mach_absolute_time()

cf_log("%SUITE_STARTED% SwiftTest\n")

var f:UInt = 0
var f2:UInt = 0
cf_log("%TEST_STARTED% factorial")
TestStart =  mach_absolute_time()
   f = factorial(15)
TestEnd = mach_absolute_time()
cf_log("factorial(15):", f)
Diff = TestEnd - TestStart;
cf_log("%TEST_FINISHED% time:", sysNS_to_absS_str(Diff), "factorial\n")

cf_log("%TEST_STARTED% factorial_by_loop")
TestStart =  mach_absolute_time()
   f = factorial_by_loop(15)
TestEnd = mach_absolute_time()
cf_log("factorial_by_loop(15):", f)
Diff = TestEnd - TestStart;
cf_log("%TEST_FINISHED% time:", sysNS_to_absS_str(Diff), 
   "factorial_by_loop\n")

cf_log("%TEST_STARTED% fibonacci")
TestStart =  mach_absolute_time()
   f = fibonacci(15)
TestEnd = mach_absolute_time()
cf_log("fibonacci(15):", fibonacci(15))
Diff = TestEnd - TestStart;
cf_log("%TEST_FINISHED% time:", sysNS_to_absS_str(Diff), "fibonacci\n")

cf_log("%TEST_STARTED% fibonacci_by_loop")
TestStart =  mach_absolute_time()
   f = fibonacci_by_loop(93)
   f2 = fibonacci_by_loop(92)
TestEnd = mach_absolute_time()
cf_log("fibonacci_by_loop(93):", f)
cf_log("fibonacci_by_loop(92):", f2)
cf_log("Golden ration:", Double(f)/Double(f2))
Diff = TestEnd - TestStart;
cf_log("%TEST_FINISHED% time:", sysNS_to_absS_str(Diff), 
   "fibonacci_by_loop\n")

cf_log("%TEST_STARTED% ClassNStruct")
TestStart =  mach_absolute_time();
cf_log("{")
cf_log("\tInt size:",    MemoryLayout<Int>.size)
cf_log("\tFloat size:",  MemoryLayout<Float>.size)
cf_log("\tUInt16 size:", MemoryLayout<UInt16>.size)
cf_log("\tCChar size:",  MemoryLayout<CChar>.size)
cf_log("}")
cf_log("Class size:",    MemoryLayout<ClassEG_>.size)
cf_log("Struct size:",   MemoryLayout<StructEG_>.size)
TestEnd =  mach_absolute_time()
Diff = TestEnd - TestStart;
cf_log("%TEST_FINISHED% time:", sysNS_to_absS_str(Diff), "ClassNStruct\n")

SuiteEnd =  mach_absolute_time()
Diff = SuiteEnd - SuiteStart;
cf_log("%SUITE_FINISHED% time:", sysNS_to_absS_str(Diff))
FH.closeFile()
