//
//  UserSettings.swift
//  Project
//
//  Created by PFei_He on 16/1/11.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/Project-Swift
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
//  ***** 用户设置 *****
//

import PFSwift

class UserSettings: PFModel {
    
    var api = String()

    //初始化
    override init() {
        super.init()
        JSON = PFFile.read(dictionary: "User-Settings.txt")
    }
    
    /**
     保存用户设置
     - Note: 无
     - Parameter userSetting: 需要保存的用户设置
     - Returns: 保存结果
     */
    class func setUserSettings(settings: Dictionary<String, AnyObject>) -> Bool {
        return PFFile.file("User-Settings.txt", setParams: settings)
    }
}
