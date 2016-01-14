//
//  Network.swift
//  Builds
//
//  Created by PFei_He on 16/1/7.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/Project-Swift
//
//  vesion: 0.0.1
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
//  ***** 网络管理 *****
//

import PFSwift
import Alamofire

///调试模式
private var debugMode = false

public class Network: PFModel {

    ///主机地址
    public var hostAddress:  String!
    
    private static let instance = Network()
    private override init() {}
    
    /**
     调试模式
     - Note: 无
     - Parameter true 或 false
     - Returns: 无
     */
    public class func setDebugMode(debugOrNot: Bool) {
        debugMode = debugOrNot
    }
    
    /**
     单例
     - Note: 无
     - Parameter 无
     - Returns: 实例
     */
    public class func sharedInstance() -> Network {
        return instance
    }
    
    /**
     发送请求
     - Note: 无
     - Parameter url: 请求的接口地址
     - Parameter params: 发送到服务器的请求参数
     - Parameter JSON: 请求返回的JSON数据
     - Returns: 无
     */
    public class func request(url: String, params: Dictionary<String, AnyObject>, results: (JSON: AnyObject?) -> Void) {
        if debugMode {
            print("[ "+String(Network)+" ]"+" request url: "+Network.sharedInstance().hostAddress+url)
        }
        //发送请求
        Alamofire.request(.POST, Network.sharedInstance().hostAddress+url, parameters: params).responseJSON(completionHandler: { (response) -> Void in
            if response.result.value != nil && response.result.value is Dictionary<String, AnyObject> {//请求成功
                results(JSON: response.result.value)
            } else {
                if debugMode {//请求失败
                    print("[ "+String(Network)+" ]"+" request error: \(response.result.error)")
                }
                results(JSON: nil)
            }
        })
    }
}
