//
//  BaseTableViewController.swift
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
//  ***** 基础列表视图控制器 *****
//

import UIKit
import PFKitSwift
import SVProgressHUD

///调试模式
private var DEBUG_MODE = false

public class BaseTableViewController: UITableViewController {

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
    private var requests = Array<BaseRequest>()
    
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
    public func initRequests(requests: Array<BaseRequest>) {
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
//    public func removeRequests(requests: Array<BaseRequest>) {
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
     - Note: 此方法已实现提示框的处理，如需自定义，请自行重写此方法
     - Parameter notification: 请求返回的通知对象
     - Returns: 无
     */
    public func requestWillStartNotification(notification: NSNotification) {
        //显示提示框
        SVProgressHUD.showWithStatus("加载中")
        
        if DEBUG_MODE {
            print("[ PROJECT ][ DEBUG ] Request will start with sender: \(notification.object!).")
            print("[ PROJECT ][ DEBUG ] Requester: \(String(classForCoder)).")
        }
    }
    
    /**
     请求已经结束
     - Note: 此方法已实现提示框的处理，如需自定义，请自行重写此方法
     - Parameter notification: 请求返回的通知对象
     - Returns: 无
     */
    public func requestWasEndedNotification(notification: NSNotification) {
        if _requestSuccess {//请求成功
            //移除提示框
            SVProgressHUD.dismiss()
        } else {//请求失败
            //显示请求失败的提示框
            SVProgressHUD.showErrorWithStatus("请求失败")
        }
        
        if DEBUG_MODE {
            print("[ PROJECT ][ DEBUG ] Request was ended with sender: \(notification.object!).")
        }
    }
    
    /**
     请求成功的通知
     - Note: 无
     - Parameter notification: 请求返回的通知对象
     - Returns: 无
     */
    public func requestSuccessNotification(notification: NSNotification) {
        _successObject      = notification.object
        _additionalObjects  = notification.userInfo
        _sender             = notification.userInfo?["sender"]
        _requestSuccess     = true
        
        if DEBUG_MODE {
            print("[ PROJECT ][ DEBUG ] Request success with result: \(notification.object!).")
        }
    }
    
    /**
     请求失败的通知
     - Note: 无
     - Parameter notification: 请求返回的通知对象
     - Returns: 无
     */
    public func requestFailedNotification(notification: NSNotification) {
        _failedObject       = notification.object
        _additionalObjects  = notification.userInfo
        _sender             = notification.userInfo?["sender"]
        _requestSuccess     = false
        
        if DEBUG_MODE {
            print("[ PROJECT ][ DEBUG ] Request failed with result: \(notification.object!).")
        }
    }
    
    // MARK: - Public Methods
    
    /**
     调试模式
     - Note: 无
     - Parameter debugOrNot: 是否打开调试模式
     - Returns: 无
     */
    public class func debugMode(debugOrNot: Bool) {
        DEBUG_MODE = debugOrNot
    }
}
