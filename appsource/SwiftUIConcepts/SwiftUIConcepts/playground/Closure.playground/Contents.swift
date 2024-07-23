import UIKit


// MARK: https://www.youtube.com/watch?v=_RQwkE_O7VQ&list=PLV7VzbWXa60EiWHqcH_pNjuVYxW0JpcET&index=4

class ClosureSample{

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



    // MARK: Non-Escaping Closures
    /*
     A non-escaping closure is a closure that is guaranteed not to be executed after the function it was passed to returns.
     */

    func performAddition(){
        print("Addition step1")
        addTwoNumbers(5, andnum2: 10) { result in
            print("Addition result = \(result)")
        }
        print("Addition final")
    }

    func performSubtraction(){
        print("Subtraction step1")
        subtractTwoNumbers(10, andnum2: 5) { result in
            print("Subtraction result = \(result)")
        }
        print("Subtraction final")
    }

    func addTwoNumbers(_ num1: Int, andnum2 num2 :Int,completionHandler: (_ result:Int)-> Void) {
        print("Addition step2")
        let result = num1 + num2
        print("Addition step3")
        completionHandler(result)
    }

    // MARK: Escaping  Closure
    /* An escaping closure is a closure that is executed after the function it is passed to returns. You declare a closure as escaping by writing @escaping before the closure type:
     */
    func subtractTwoNumbers(_ num1: Int, andnum2 num2 :Int,completionHandler: @escaping(_ result:Int)-> Void) {
        let result = num1 - num2
        print("Subtraction step2")
        DispatchQueue.main.asyncAfter(deadline: .now() + 10){
            print("Subtraction step3")
            completionHandler(result)
        }
    }



    // MARK: Lifetime:
    /*  - Non-escaping closures are guaranteed to be executed before the function returns.
     - Escaping closures can outlive the function and be executed later.
     */


    // MARK: Syntax:
    /*  - Non-escaping closures do not require special syntax.
     - Escaping closures must be marked with @escaping.
     */

    // MARK: Memory Management:
    /*  Since escaping closures can outlive the function, they may lead to retain cycles if not managed properly. Capturing self strongly in escaping closures can cause memory leaks.
     */

    func performMultiplication(){
        print("Multiplication step1")
        multiplyTwoNumbers(10, andnum2: 5) { result in
            printSample()
            print("Multiplication result = \(result)")
        }
        print("Multiplication final")
    }

    func performDivision(){
        print("Division step1")
        divideTwoNumbers(10, andnum2: 5) {[weak self] result in // weak is referred to avoid the strong reference of printSample function
            self?.printSample()
            print("Division result = \(result)")
        }
        print("Division final")
    }


    func printSample(){
        print("printSample")
    }
    func multiplyTwoNumbers(_ num1: Int, andnum2 num2 :Int,completionHandler:(_ result:Int)-> Void) {
        print("Multiplication step2")
        let result = num1 * num2
        print("Multiplication step3")
        completionHandler(result)
    }

    func divideTwoNumbers(_ num1: Int, andnum2 num2 :Int,completionHandler: @escaping(_ result:Int)-> Void) {
        let result = num1 / num2
        print("Division step2")
        DispatchQueue.main.asyncAfter(deadline: .now() + 10){
            print("Division step3")
            completionHandler(result)
        }
    }
}


let closureSample = ClosureSample()

closureSample.performAddition()
closureSample.performSubtraction()
closureSample.performMultiplication()
closureSample.performDivision()
