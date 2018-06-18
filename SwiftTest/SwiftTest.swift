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

func factorial_by_loop(_ n: UInt) -> UInt {
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

func fibonacci_by_loop (_ n: UInt) -> UInt {
   var n0:UInt = 1;
   var n1:UInt = 1;
   var n2:UInt = 1;
   for _ in 3...n {
      n2 = n1;
      n1 = n0;
      n0 = n1 + n2;
   }
   return n0;
}


class ClassEG_ {
   var IntMem : Int = 0
   var FloatMem : Float = 0.0
   var UInt16Mem : UInt16 = 0
   var CharMem : CChar = 30
}

struct StructEG_ {
   var IntMem : Int = 0
   var FloatMem : Float = 0.0
   var UInt16Mem : UInt16 = 0
   var CharMem : CChar = 30
}

func test_struct () {
   
}

