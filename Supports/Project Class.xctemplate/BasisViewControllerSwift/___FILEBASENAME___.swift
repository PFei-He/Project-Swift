//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//
//  *****  *****
//

import Builds

class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_cocoaTouchSubclass___ {
    
    ///请求接口
    private let req = <#Request#>()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //初始化网络请求
        initRequests([req])
        
        //设置参数并发送请求
        params()
        req.send()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Datas Management
    
    ///参数
    private func params() {
        
    }
}
