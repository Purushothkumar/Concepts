import UIKit

class Account:NSObject{

    @objc dynamic var bankBalance: Int

    func depositAmount(amount:Int){
        bankBalance += amount
    }
    func withdrawAmount(amount:Int){

        let checkBalancebool = checkBalance()
        let  canWithdrawAmountbool =  canWithdrawAmount(amount: amount)

        guard checkBalance(),
           canWithdrawAmount(amount: amount) else {
            print("Insufficient Fund")
            return
        }
        bankBalance -= amount

    }
    func checkBalance() -> Bool{
        return bankBalance > 0 ? true : false
    }

    func canWithdrawAmount(amount:Int) -> Bool{
        return bankBalance > amount ? true : false
    }

//    var human: Human

    init(bankBalance :Int) {
        self.bankBalance = bankBalance
    }



}

class Human :NSObject{
    var name :String
    var accountNumber :Int
    @objc var balance:Account


    init(name: String, accountNumber: Int,balance: Account) {
        self.name = name
        self.accountNumber = accountNumber
        self.balance = balance
    }

    func checkBalance(){
        balance.addObserver(self, forKeyPath: #keyPath(Account.bankBalance),options: .new, context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print(change)
    }
}

let Person1 = Human(name: "Purushoth", accountNumber: 324982934,balance: Account.init(bankBalance: 1000))
//Person1.checkBalance()


//print("new person \(Person1.name) \n accountNumber \(Person1.accountNumber) \n  balance \(Person1.balance.bankBalance)")
let obj = Person1.balance.withdrawAmount(amount: 100)
let obj1 = Person1.balance.depositAmount(amount: 100)


print("new person \(Person1.name) \n accountNumber \(Person1.accountNumber) \n  balance \(Person1.balance.bankBalance)")

