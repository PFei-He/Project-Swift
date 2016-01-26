//
//
//   __________   __________    _________   ___________  ___________   __________  ___________
//  |  _______ \ |  _______ \  / _______ \ |______   __||  _________| / _________||____   ____|
//  | |       \ || |       \ || /       \ |       | |   | |          | /               | |
//  | |_______/ || |_______/ || |       | |       | |   | |_________ | |               | |
//  |  ________/ |  _____  _/ | |       | | _     | |   |  _________|| |               | |
//  | |          | |     \ \  | |       | || |    | |   | |          | |               | |
//  | |          | |      \ \ | \_______/ || \____/ |   | |_________ | \_________      | |
//  |_|          |_|       \_\ \_________/  \______/    |___________| \__________|     |_|
//
//
//  The template design by https://github.com/PFei-He/Project-Swift
//
//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//
//  ***** 数据模型接口 *****
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
