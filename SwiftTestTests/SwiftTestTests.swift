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
      // Put setup code here. This method is called before the invocation of each test method in the class.
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
   
   /*func testExample() {
      // This is an example of a functional test case.
      // Use XCTAssert and related functions to verify your tests produce the correct results.
   }*/
   
   /*func testExample() {
//      self.measure {
//         factorial_by_loop(n:20)
//      }
   }*/
   
   func testPerformanceFactorial() {
      self.measure {
         print(factorial(15))
         print(UInt.bitWidth)
      }
   }
   
   func testPerformanceFibonacci() {
      self.measure {
         print(fibonacci(15))
      }
   }
   
}
