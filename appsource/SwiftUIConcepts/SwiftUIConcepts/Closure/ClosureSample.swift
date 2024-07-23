//
//  File.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 23/07/24.
//

import Foundation

// MARK: Closure

/*
 Closures in Swift are self-contained blocks of functionality that can be passed around and used in your code. They are similar to blocks in C and Objective-C and to lambdas in other programming languages.
 */
// MARK: syntax
/*

 {(parameter) -> returntype in
    //code
 }
 */

class ClosureSample{
    func performAddition(){
//        print("step1")
        addTwoNumbers(5, andnum2: 10) { result in
//            print("Addition = \(result)")
        }
//        print("step2")
    }

    func performSubtraction(){
//        print("step3")
        subtractTwoNumbers(10, andnum2: 5) { result in
//            print("Subtraction = \(result)")
        }
//        print("step4")
    }

    func addTwoNumbers(_ num1: Int, andnum2 num2 :Int,completionHandler: (_ result:Int)-> Void) {
         let result = num1 + num2
        completionHandler(result)
    }

    func subtractTwoNumbers(_ num1: Int, andnum2 num2 :Int,completionHandler: @escaping(_ result:Int)-> Void) {
        let result = num1 - num2
       completionHandler(result)
    }
}


