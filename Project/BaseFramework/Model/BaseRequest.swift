//
//  BaseRequest.swift
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
//  ***** 基础请求处理 *****
//

import PFKitSwift
import Alamofire

///调试模式
private var DEBUG_MODE = false

public class BaseRequest: Model {

    ///主机地址
    public var hostAddress  = String()
    
    ///请求地址的接口
    public var requestAPI   = String()
    
    /**
     单例
     - Note: 无
     - Parameter 无
     - Returns: 实例
     */
    public class func sharedInstance() -> BaseRequest {
        struct singleton{
            static var BaseRequest_onceToken: dispatch_once_t = 0
            static var instance: BaseRequest? = nil
        }
        dispatch_once(&singleton.BaseRequest_onceToken) { () -> Void in
            singleton.instance = BaseRequest()
        }
        return singleton.instance!
    }
    
    /**
     添加请求者
     - Note: 无
     - Parameter requester: 请求者
     - Returns: 无
     */
    public func add(requester: AnyObject) {
        NSNotificationCenter.defaultCenter().addObserver(requester, selector: NSSelectorFromString("requestStartedNotification:"), name: String(classForCoder)+"Started", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(requester, selector: NSSelectorFromString("requestEndedNotification:"), name: String(classForCoder)+"Ended", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(requester, selector: NSSelectorFromString("requestSuccessNotification:"), name: String(classForCoder)+"Success", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(requester, selector: NSSelectorFromString("requestFailureNotification:"), name: String(classForCoder)+"Failure", object: nil)
    }
    
    /**
     移除请求者
     - Note: 无
     - Parameter requester: 请求者
     - Returns: 无
     */
    public func remove(requester: AnyObject) {
        NSNotificationCenter.defaultCenter().removeObserver(requester, name: String(classForCoder)+"Started", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(requester, name: String(classForCoder)+"Ended", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(requester, name: String(classForCoder)+"Success", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(requester, name: String(classForCoder)+"Failure", object: nil)
    }
    
    /**
     发送请求
     - Note: 无
     - Parameter JSON: 请求返回的JSON数据
     - Returns: 无
     */
    public func send(results: (JSON: AnyObject?) -> Void) {
        send(requestAPI, results: results)
    }
    
    /**
     发送请求
     - Note: 无
     - Parameter api: 接口地址
     - Parameter JSON: 请求返回的JSON数据
     - Returns: 无
     */
    public func send(api: String, results: (JSON: AnyObject?) -> Void) {
        send(api, params: createJSON(), results: results)
    }
    
    /**
     发送请求
     - Note: 无
     - Parameter api: 接口地址
     - Parameter params: 请求参数
     - Parameter JSON: 请求返回的JSON数据
     - Returns: 无
     */
    public func send(api: String, params: Dictionary<String, AnyObject>, results: (JSON: AnyObject?) -> Void) {
        
        //发送请求开始的通知
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Started", object: classForCoder)
        
        if DEBUG_MODE {
            print("[ RPOJECT ][ DEBUG ] Request url: \(BaseRequest.sharedInstance().hostAddress+api).")
            if !params.isEmpty {
                print("[ PROJECT ][ DEBUG ] Request params: \(String(params)).")
            }
        }
        
        //发送请求
        Alamofire.request(.POST, BaseRequest.sharedInstance().hostAddress+api, parameters: params).responseJSON(completionHandler: { [unowned self] (response) -> Void in
            if response.result.value != nil && response.result.value is Dictionary<String, AnyObject> {//请求成功
                results(JSON: response.result.value)
            } else {
                if DEBUG_MODE {
                    print("[ PROJECT ][ DEBUG ] Request error: \(response.result.error).")
                }
                results(JSON: nil)
            }
        })
    }
    
    /**
     请求成功
     - Note: 无
     - Parameter successResult: 请求结果
     - Returns: 无
     */
    public func finished(successResult result: AnyObject) {
        
        //发送请求成功通知
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Success", object: result, userInfo: ["sender": classForCoder])
        
        //发送请求结束通知
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Ended", object: classForCoder)
    }
    
    /**
     请求成功
     - Note: 无
     - Parameter successResult: 请求结果
     - Parameter additionalResults: 附带参数
     - Returns: 无
     */
    public func finished(successResult result: AnyObject, additionalResults: Dictionary<String, AnyObject>) {
        
        //发送请求成功通知
        var dictionary = additionalResults
        dictionary.addEntries(["sender": classForCoder])
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Success", object: result, userInfo: dictionary)
        
        //发送请求结束通知
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Ended", object: classForCoder)
    }
    
    /**
     请求失败
     - Note: 无
     - Parameter failureResult: 请求结果
     - Returns: 无
     */
    public func finished(failureResult result: AnyObject) {
        
        //发送请求失败通知
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Failure", object: result, userInfo: ["sender": classForCoder])
        
        //发送请求结束通知
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Ended", object: classForCoder)
    }
    
    /**
     请求失败
     - Note: 无
     - Parameter failureResult: 请求结果
     - Parameter additionalResults: 附带参数
     - Returns: 无
     */
    public func finished(failureResult result: AnyObject, additionalResults: Dictionary<String, AnyObject>) {
        
        //发送请求失败通知
        var dictionary = additionalResults
        dictionary.addEntries(["sender": classForCoder])
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Failure", object: result, userInfo: dictionary)
        
        //发送请求结束通知
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Ended", object: classForCoder)
    }
    
    /**
     调试模式
     - Note: 无
     - Parameter openOrNot: 是否打开调试模式
     - Returns: 无
     */
    public class func debugMode(openOrNot: Bool) {
        DEBUG_MODE = openOrNot
    }
}
