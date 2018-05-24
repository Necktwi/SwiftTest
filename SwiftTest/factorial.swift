//
//  factorial.swift
//  SwiftTest
//
//  Created by Gowtham Kudupudi on 23/05/18.
//  Copyright © 2018 ferryfair. All rights reserved.
//

import Foundation

func factorial(_ n: UInt) -> UInt {
   if n <= 2 {
      return 2
   } else {
      return n * factorial(n - 1)
   }
}

func factorial_by_loop(n: UInt) -> UInt {
   var m: UInt = 1
   for i in 2...n {
      m *= i
   }
   return m
}

func fibonacci (_ n: UInt) -> UInt {
   if n <= 2 {
      return 1
   } else {
      return fibonacci(n - 1) + fibonacci(n - 2)
   }
}
