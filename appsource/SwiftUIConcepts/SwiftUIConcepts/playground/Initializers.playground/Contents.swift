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
}

let person = Person(name: "")
let employee = Employee(name: "")












