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
