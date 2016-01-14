//
//  BasisRequest.swift
//  Builds
//
//  Created by PFei_He on 16/1/8.
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
//  ***** 基础请求处理 *****
//

import PFSwift

///调试模式
private var debugMode = false

public class BasisRequest: PFModel {
    
    ///请求地址的接口
    public var requestAPI = String()

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
     发送请求
     - Note: 无
     - Parameter JSON: 请求返回的JSON数据
     - Returns: 无
     */
    public func send(results: (JSON: AnyObject?) -> Void) {
        sendWithAPI(requestAPI, results: results)
    }
    
    /**
     发送请求
     - Note: 无
     - Parameter api: 接口地址
     - Parameter JSON: 请求返回的JSON数据
     - Returns: 无
     */
    public func sendWithAPI(api: String, results: (JSON: AnyObject?) -> Void) {
        sendWithAPI(api, params: createJSON(), results: results)
    }
    
    /**
     发送请求
     - Note: 无
     - Parameter api: 接口地址
     - Parameter params: 请求参数
     - Parameter JSON: 请求返回的JSON数据
     - Returns: 无
     */
    public func sendWithAPI(api: String, params: Dictionary<String, AnyObject>, results: (JSON: AnyObject?) -> Void) {
        if debugMode {
            print("[ "+String(Network)+" ]"+" request sender: "+String(classForCoder))
            if !params.isEmpty {
                print("[ "+String(classForCoder)+" ]"+" request params: "+String(params))
            }
        }
        Network.request(api, params: params, results: results)
    }
    
    /**
     添加请求者
     - Note: 无
     - Parameter requester: 请求者
     - Returns: 无
     */
    public func addRequester(requester: AnyObject) {
        NSNotificationCenter.defaultCenter().addObserver(requester, selector: "requestWillStartNotification:", name: String(classForCoder)+"WillStart", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(requester, selector: "requestWasEndedNotification:", name: String(classForCoder)+"WasEnded", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(requester, selector: "requestSuccessNotification:", name: String(classForCoder)+"Success", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(requester, selector: "requestFailedNotification:", name: String(classForCoder)+"Failed", object: nil)
    }
    
    /**
     请求即将开始
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    public func requestWillStart() {
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"WillStart", object: classForCoder)
    }
    
    /**
     请求已经结束
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    public func requestWasEnded() {
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"WasEnded", object: classForCoder)
    }
    
    /**
     请求成功
     - Note: 无
     - Parameter object: 请求结果
     - Returns: 无
     */
    public func requestSuccessWithObject(object: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Success", object: object, userInfo: ["sender": classForCoder])
    }
    
    /**
     请求成功
     - Note: 无
     - Parameter object: 请求结果
     - Parameter userInfo: 附带参数
     - Returns: 无
     */
    public func requestSuccessWithObject(object: AnyObject, userInfo: Dictionary<String, AnyObject>) {
        var dictionary = userInfo
        dictionary.addEntries(["sender": classForCoder])
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Success", object: object, userInfo: dictionary)
    }
    
    /**
     请求失败
     - Note: 无
     - Parameter object: 请求结果
     - Returns: 无
     */
    public func requestFailedWithObject(object: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Failed", object: object, userInfo: ["sender": classForCoder])
    }
    
    /**
     请求失败
     - Note: 无
     - Parameter object: 请求结果
     - Parameter userInfo: 附带参数
     - Returns: 无
     */
    public func requestFailedWithObject(object: AnyObject, userInfo: Dictionary<String, AnyObject>) {
        var dictionary = userInfo
        dictionary.addEntries(["sender": classForCoder])
        NSNotificationCenter.defaultCenter().postNotificationName(String(classForCoder)+"Failed", object: object, userInfo: dictionary)
    }
    
    /**
     移除请求者
     - Note: 无
     - Parameter requester: 请求者
     - Returns: 无
     */
    public func removeRequester(requester: AnyObject) {
        NSNotificationCenter.defaultCenter().removeObserver(requester, name: String(classForCoder)+"WillStart", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(requester, name: String(classForCoder)+"WasEnded", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(requester, name: String(classForCoder)+"Success", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(requester, name: String(classForCoder)+"Failed", object: nil)
    }
}
