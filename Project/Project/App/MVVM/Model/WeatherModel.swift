//
//  WeatherModel.swift
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
//  ***** 天气接口 *****
//


import UIKit

class WeatherResult: BaseModel {
    
    var Radar       = String()
    var SD          = String()
    var WD          = String()
    var WS          = String()
    var WSE         = Int()
    var city        = String()
    var cityid      = Int()
    var isRadar     = Int()
    var njd         = String()
    var qy          = Int()
    var temp        = Int()
    var time        = String()
}

class WeatherModel: BaseModel {
    
    var weatherinfo = Dictionary<String, AnyObject>()
}

class WeatherRequest: BaseRequest {
    
    /**
     发送请求
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    func send() {
        send { [unowned self] (JSON) -> Void in
            if JSON != nil {
                let model = WeatherModel(JSON: JSON!)
                let result = WeatherResult(JSON: model.weatherinfo)
                self.requestSuccess(result)
            } else {
                self.requestFailed("请求失败")
            }
        }
    }
}
