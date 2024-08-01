import UIKit


class logger{
    
    static let shared = logger()
    let id = UUID().uuidString
    
//    private init(){}
    func logSuccess(){
        print("logSuccess \(id)")
    }
    
    func loggererror(){
        print("loggererror \(id)")
    }
}

class LoginManage{
    
    func login(){
        logger.shared.logSuccess()
//        logger().logSuccess()
    }
}
class SignupManage{
    func signup(){
        logger.shared.logSuccess()
//        logger().logSuccess()
    }
}

let login = LoginManage()
login.login()

let signup = SignupManage()
signup.signup()


enum ApiEnvironment: String{
    case development
    case staging
    case production
    
    var endPoint:String{
        switch self {
            
        case .development:
            return "www.development.com"
        case .production:
            return "www.production.com"
        case .staging:
            return "www.staging.com"
        default:
            return "www.development.com"
        }
    }
}

class ApiConfiguration {
    static let shared = ApiConfiguration(environment: .development)
    var environment: ApiEnvironment
    
    init(environment: ApiEnvironment) {
        self.environment = environment
    }
    
    func updateEnvironment(environment: ApiEnvironment){
        self.environment = environment
    }
    
}
class stockdata{
    let config = ApiConfiguration.shared
    func fetchdata(){
        print("stockdata endpoint :\(config.environment.endPoint)")
    }
}
class querydata{
    let config = ApiConfiguration.shared
    func fetchdata(){
        print("querydata endpoint :\(config.environment.endPoint)")

    }
}


let service1 = stockdata()
service1.fetchdata()
let service2 = querydata()
service2.fetchdata()

ApiConfiguration.shared.updateEnvironment(environment: .production)
service1.fetchdata()
service2.fetchdata()
