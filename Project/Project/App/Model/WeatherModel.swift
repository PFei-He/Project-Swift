//
//  WeatherModel.swift
//  Project
//
//  Created by PFei_He on 16/1/11.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/Project-Swift
//
//  vesion:
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
//  *****  *****
//

import PFSwift
import Builds

class WeatherResult: PFModel {
    
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

class WeatherModel: PFModel {

    var weatherinfo = Dictionary<String, AnyObject>()
}

class WeatherRequest: BasisRequest {
    
    /**
     发送请求
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    func send() {
        requestWillStart()
        send { [unowned self] (JSON) -> Void in
            if JSON != nil {
                let model = WeatherModel(JSON: JSON!)
                let result = WeatherResult(JSON: model.weatherinfo)
                self.requestSuccessWithObject(result)
                self.requestWasEnded()
            } else {
                self.requestFailedWithObject("请求失败")
                self.requestWasEnded()
            }
        }
    }
}
