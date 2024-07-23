import UIKit

//MARK: Initializers

//initializers are special methods used to set up a new instance of a class, structure, or enumeration. They ensure that all properties of the instance are given initial values and perform any other setup or initialization required.



.



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


//MARK:Failable Initializers

//

/*

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


//MARK:Required Initializers

//

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
