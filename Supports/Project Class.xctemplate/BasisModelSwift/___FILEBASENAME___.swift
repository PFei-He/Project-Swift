//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//
//  ***** 接口 *****
//

import PFSwift
import Builds

class <#Result#>: PFModel {
    
}

class ___FILEBASENAMEASIDENTIFIER___: PFModel {

}

class <#Request#>: BasisRequest {
    
    /**
     发送请求
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    func send() {
        requestWillStart()
        sendWithAPI(<#T##api: String##String#>) { [unowned self] (JSON) -> Void in
            if JSON != nil {
                self.requestSuccessWithObject(<#result#>)
                self.requestWasEnded()
            } else {
                self.requestFailedWithObject(<#result#>)
                self.requestWasEnded()
            }
        }
    }
}
