import UIKit

//MARK: Initializers

//initializers are special methods used to set up a new instance of a class, structure, or enumeration. They ensure that all properties of the instance are given initial values and perform any other setup or initialization required.

class Person{
    var name:String

    init(name: String) {
        self.name = name
    }
}

struct Employee {
    var name: String
    // by default struct have the initializer
}

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
let person = Person(name: "")
let employee = Employee(name: "")


//MARK: Designated Initializers

//Designated initializers are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain

/*
 Primary initializers for a class.
 Fully initialize all properties of a class.
 Can be inherited by subclasses.

 */

class DesignatedInitializers {
    var name:String
    var country:String // optional type initializer

    init(name: String, country: String) {
        self.name = name
        self.country = country
    }
}

let person1 = DesignatedInitializers(name: "pk", country: "India")


//MARK: Convenience Initializers

//

/*
 Secondary initializers that must call a designated initializer from the same class.
 They are often used to provide default values or other initialization options.
 */

class NewPerson {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    convenience init() {
        self.init(name: "Unknown", age: 0)
    }
}


//MARK: Failable Initializers
//It’s sometimes useful to define a class, structure, or enumeration for which initialization can fail. This failure might be triggered by invalid initialization parameter values, the absence of a required external resource, or some other condition that prevents initialization from succeeding.

/*
 Initializers that can return nil if initialization fails.
 */

class FailableInitializers {
    var name: String
    var price: Double

    init?(name: String, price: Double) {
        if price < 0 {
            return nil
        }
        self.name = name
        self.price = price
    }
}


//MARK: Required Initializers

//Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer:



/*
 Must be implemented by every subclass.
 */
class RequiredInitializers {
    required init() {
        // Required initializer implementation
    }
}

class SomeSubclass: RequiredInitializers {
    required init() {
        // Subclass implementation of required initializer
        super.init()

    }
}

// fatalError(super.init()) // fatal error is to be capture for the non UI Components
// super.init(coder: coder) // for UI Components nscoder

/*
required init?(coder: NSCoder) {
       super.init(coder: coder)
       // Additional setup for SubSafeView
   }
   
   override init(frame: CGRect) {
       super.init(frame: frame)
       // Additional setup for SubSafeView
   }
*/



