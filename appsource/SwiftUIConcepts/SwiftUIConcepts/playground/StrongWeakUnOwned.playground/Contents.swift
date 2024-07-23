import UIKit


// MARK: https://www.youtube.com/watch?v=Lzl9h_MovJg&list=PLV7VzbWXa60EiWHqcH_pNjuVYxW0JpcET&index=1
/*
 // MARK: Strong
 Strong: Default, increments reference count, prevents deallocation.
 When you use a strong reference, the reference count of the object it points to is incremented by one. As long as there is at least one strong reference to an object, it will not be deallocated

 // MARK: Weak
 Weak: Does not increment reference count, allows deallocation, automatically set to nil when the object is deallocated.
 A reference that does not prevent the referenced object from being deallocated

 When you use a weak reference, the reference count of the object it points to is not incremented. If there are only weak references to an object, it can be deallocated, and the weak reference will automatically be set to nil.

 // MARK: Unowned
 - Unowned: Does not increment reference count, assumes the reference will never be nil, can cause a crash if accessed after deallocation.

 A reference that does not prevent the referenced object from being deallocated but assumes that the reference will never become nil after it is first set.


 Similar to a weak reference, but it is expected that the referenced object will not be deallocated as long as the unowned reference exists. Accessing an unowned reference after the object it points to is deallocated will result in a runtime crash


 */


class Vechicle{
    var car: Car?
    var id: Int

    init(car: Car?, id: Int) {
        self.car = car
        self.id = id
        print("\(self) is allocated \(id)")
    }

    deinit {
        print("\(self) is deallocated \(id)")
    }

}
class Car{
//    var vechicle: Vechicle?
    weak var vechicle: Vechicle? // removes the circular reference

    var name: String

    init(vechicle: Vechicle?, name: String) {
        self.vechicle = vechicle
        self.name = name
        print("\(self) is allocated \(name)")
    }

    deinit {
        print("\(self) is deallocated \(name)")
    }
}

//Vechicle(car: nil, id: 1) //prints allocated and deallocated

var vechicle:Vechicle? = Vechicle(car: nil, id: 2) // allocated
var car:Car? = Car(vechicle: nil, name: "lancer") // allocated

vechicle?.car = car // circular reference
car?.vechicle = vechicle // circular reference

vechicle = nil // deallocated
car = nil // deallocated



// MARK: Circular Refrence

/*
 A circular reference type occurs when two or more types refer to each other directly or indirectly, creating a loop. This can happen with classes, structs, or other data types. Circular references can lead to memory leaks or crashes if not handled properly, especially in languages that use reference counting for memory management, like Swift.
 */

/*
 To break the circular reference and avoid memory leaks, you can use weak or unowned references:

 Weak reference: A weak reference does not increase the reference count of the object it refers to. It's typically used when the reference may become nil during the object's lifetime.
 Unowned reference: An unowned reference does not increase the reference count of the object it refers to and is used when the reference is not expected to become nil before the referencing object is deallocated.

 */

class Person {
    var pet: Pet?
    deinit {
        print("Person deinitialized")
    }
}

class Pet {
    var owner: Person?
    deinit {
        print("Pet deinitialized")
    }
}

var john: Person? = Person()
var fido: Pet? = Pet()

john?.pet = fido
fido?.owner = john

//john = nil
//fido = nil



