//
//  SwiftTestTests.swift
//  SwiftTestTests
//
//  Created by Gowtham Kudupudi on 23/05/18.
//  Copyright © 2018 ferryfair. All rights reserved.
//

import XCTest
@testable import SwiftTest

class SwiftTestTests: XCTestCase {
   
   override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of 
      // each test method in the class.
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of 
      // each test method in the class.
      super.tearDown()
   }
   
   func testPerformanceFactorial() {
      self.measure {
         print(factorial(15))
         print(UInt.bitWidth)
      }
   }
   
   func testPerformanceFibonacci() {
      self.measure {
         print(fibonacci(15))
         let currentTime = mach_absolute_time()
         print("CurrentTime: ", currentTime)
      }
   }
   
   func testPerformanceClassNStruct() {
      self.measure {
         print("Int size: ", MemoryLayout<Int>.size)
         print("CChar size: ", MemoryLayout<CChar>.size)
         print("Character size: ", MemoryLayout<Character>.size)
         print("Float size: ", MemoryLayout<Float>.size)
         print("Class size: ", MemoryLayout<ClassEG_>.size)
         print("Struct size: ", MemoryLayout<StructEG_>.size)
      }
   }
   
}
