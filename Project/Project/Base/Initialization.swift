//
//  Initialization.swift
//  Project
//
//  Created by PFei_He on 16/5/10.
//  Copyright © 2016年 PFei_He. All rights reserved.
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
//  The framework design by https://github.com/PFei-He/Project-Swift
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  ***** 初始化 *****
//

import PFKitSwift

class Initialization: NSObject {

    /**
     初始化登录页
     - Note: 无
     - Parameter 无
     - Returns: 根视图控制器
     */
    class func initLaunch() -> UIViewController {
        if NSUserDefaults.standardUserDefaults().boolForKey("launch") {
            let tabBarController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateInitialViewController() as! UITabBarController
            tabBarController.viewControllers = [UIStoryboard(name: "Home", bundle: NSBundle.mainBundle()).instantiateInitialViewController()!,
                                                UIStoryboard(name: "More", bundle: NSBundle.mainBundle()).instantiateInitialViewController()!]
            return tabBarController
        } else {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "launch")
            NSUserDefaults.standardUserDefaults().synchronize()
            let viewController = UIStoryboard(name: "Guide", bundle: NSBundle.mainBundle()).instantiateInitialViewController()
            return viewController!
        }
    }
    
    /**
     初始化主机地址
     - Note: 无
     - Parameter url: 主机地址
     - Returns: 无
     */
    class func initHost(url: String) {
        BaseRequest.sharedInstance().hostAddress = url
    }
    
    /**
     初始化接口地址
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    class func initApi() {
        Api.sharedInstance().JSON = File.read(JSON: "api")
    }
    
    /**
     初始化用户文件
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    class func initUserFile() {
        File.create("User-Settings.txt")
    }
}
