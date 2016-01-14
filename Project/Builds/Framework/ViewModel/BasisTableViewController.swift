//
//  BasisTableViewController.swift
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
//  ***** 基础列表视图控制器 *****
//

import UIKit
import PFSwift
import SVProgressHUD

///调试模式
private var debugMode = false

public class BasisTableViewController: UITableViewController {

    ///请求成功返回的结果
    public var successObject:      AnyObject? {
        return _successObject
    }
    private var _successObject:     AnyObject?

    ///请求失败返回的结果
    public var failedObject:       AnyObject? {
        return _failedObject
    }
    private var _failedObject:      AnyObject?

    ///请求返回的附加结果
    public var additionalObjects:  AnyObject? {
        return _additionalObjects
    }
    private var _additionalObjects: AnyObject?
    
    ///请求的发送者
    public var sender:             AnyObject? {
        return _sender
    }
    private var _sender:            AnyObject?
    
    ///请求是否成功
    public var requestSuccess:     Bool {
        return _requestSuccess
    }
    private var _requestSuccess =   Bool()
    
    ///所有的请求
    private var requests = Array<BasisRequest>()
    
    //MARK: - Life Cycle
    
    deinit {
        removeRequests()
    }
    
    // MARK: - Request Management
    
    /**
     初始化请求
     - Note: 无
     - Parameter requests: 所有的请求
     - Returns: 无
     */
    public func initRequests(requests: Array<BasisRequest>) {
        self.requests = requests
        for request in requests {
            request.addRequester(self)
        }
    }
    
    /**
     移除请求
     - Note: 无
     - Parameter requests: 所有的请求
     - Returns: 无
     */
//    func removeRequests(requests: Array<BasisRequest>) {
//        for request in requests {
//            request.removeRequester(self)
//        }
//    }
    
    ///移除请求
    private func removeRequests() {
        for request in self.requests {
            request.removeRequester(self)
        }
    }
    
    // MARK: - Notification Management
    
    /**
     请求即将开始
     - Note: 无
     - Parameter notification: 请求返回的通知对象
     - Returns: 无
     */
    public func requestWillStartNotification(notification: NSNotification) {
        if debugMode {
            print("[ "+String(classForCoder)+" ]"+" request will start")
        }
        //显示提示框
        SVProgressHUD.showWithStatus("加载中")
    }
    
    /**
     请求已经结束
     - Note: 无
     - Parameter notification: 请求返回的通知对象
     - Returns: 无
     */
    public func requestWasEndedNotification(notification: NSNotification) {
        if debugMode {
            print("[ "+String(classForCoder)+" ]"+" request was ended")
        }
        if _requestSuccess {//请求成功
            //移除提示框
            SVProgressHUD.dismiss()
        } else {//请求失败
            //显示请求失败的提示框
            SVProgressHUD.showErrorWithStatus("请求失败")
        }
    }
    
    /**
     请求成功的通知
     - Note: 无
     - Parameter notification: 请求返回的通知对象
     - Returns: 无
     */
    public func requestSuccessNotification(notification: NSNotification) {
        if debugMode {
            print("[ "+String(classForCoder)+" ]"+" request result: \(notification.object!)")
        }
        _successObject      = notification.object
        _additionalObjects  = notification.userInfo
        _sender             = notification.userInfo?["sender"]
        _requestSuccess     = true
    }
    
    /**
     请求失败的通知
     - Note: 无
     - Parameter notification: 请求返回的通知对象
     - Returns: 无
     */
    public func requestFailedNotification(notification: NSNotification) {
        if debugMode {
            print("[ "+String(classForCoder)+" ]"+" request result: \(notification.object!)")
        }
        _failedObject       = notification.object
        _additionalObjects  = notification.userInfo
        _sender             = notification.userInfo?["sender"]
        _requestSuccess     = false
    }
    
    // MARK: - Public Methods
    
    /**
     调试模式
     - Note: 无
     - Parameter true 或 false
     - Returns: 无
     */
    public class func setDebugMode(debugOrNot: Bool) {
        debugMode = debugOrNot
    }
}
