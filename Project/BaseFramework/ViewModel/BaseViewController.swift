//
//  BaseViewController.swift
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
//  ***** 基础视图控制器 *****
//

import UIKit
import PFKitSwift
import SVProgressHUD

///调试模式
private var DEBUG_MODE = false

public class BaseViewController: UIViewController {

    ///请求成功返回的结果
    public var successResult:       AnyObject? {
        return _successResult
    }
    private var _successResult:     AnyObject?
    
    ///请求失败返回的结果
    public var failureResult:       AnyObject? {
        return _failureResult
    }
    private var _failureResult:     AnyObject?
    
    ///请求返回的附加结果
    public var additionalResults:   AnyObject? {
        return _additionalResults
    }
    private var _additionalResults: AnyObject?
    
    ///请求的发送者
    public var sender:              AnyObject? {
        return _sender
    }
    private var _sender:            AnyObject?
    
    ///请求是否成功
    public var requestIsSuccess:    Bool {
        return _requestIsSuccess
    }
    private var _requestIsSuccess = Bool()
    
    ///所有的请求
    private var requests = Array<BaseRequest>()
    
    //MARK: - Life Cycle
    
    deinit {
        removeAllRequests()
    }
    
    // MARK: - Request Management
    
    /**
     初始化请求
     - Note: 无
     - Parameter requests: 所有的请求
     - Returns: 无
     */
    public func addRequests(requests: Array<BaseRequest>) {
        self.requests = requests
        for request in requests {
            request.add(self)
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
    private func removeAllRequests() {
        for request in self.requests {
            request.remove(self)
        }
    }
    
    // MARK: - Notification Management
    
    //请求开始通知
    func requestStartedNotification(notification: NSNotification) {
        if DEBUG_MODE {//调试模式
            print("[ PROJECT ][ DEBUG ] Request started with sender: \(notification.object!).")
            print("[ PROJECT ][ DEBUG ] Requester: \(String(classForCoder)).")
        }
        
        //请求开始
        requestStarted()
    }
    
    //请求结束通知
    func requestEndedNotification(notification: NSNotification) {
        if DEBUG_MODE {//调试模式
            print("[ PROJECT ][ DEBUG ] Request ended with sender: \(notification.object!).")
        }
        
        //请求结束
        requestEnded()
    }
    
    //请求成功通知
    func requestSuccessNotification(notification: NSNotification) {
        if DEBUG_MODE {//调试模式
            print("[ PROJECT ][ DEBUG ] Request success with result: \(notification.object!).")
        }
        
        //处理请求结果
        _successResult      = notification.object
        if notification.userInfo is Dictionary<String, AnyObject> {
            var dictionary: Dictionary<String, AnyObject> = notification.userInfo as! Dictionary<String, AnyObject>
            _additionalResults = dictionary.removeValueForKey("sender")
        }
        _sender             = notification.userInfo?["sender"]
        _requestIsSuccess   = true
        
        //请求成功
        requestSuccess()
    }
    
    //请求失败通知
    func requestFailureNotification(notification: NSNotification) {
        if DEBUG_MODE {//调试模式
            print("[ PROJECT ][ DEBUG ] Request failure with result: \(notification.object!).")
        }
        
        //处理请求结果
        _failureResult      = notification.object
        if notification.userInfo is Dictionary<String, AnyObject> {
            var dictionary: Dictionary<String, AnyObject> = notification.userInfo as! Dictionary<String, AnyObject>
            _additionalResults = dictionary.removeValueForKey("sender")
        }
        _sender             = notification.userInfo?["sender"]
        _requestIsSuccess   = false
        
        //请求失败
        requestFailure()
    }
    
    // MARK: - Public Methods
    
    /**
     请求开始
     - Note: 此方法已实现提示框的处理，如需自定义，请自行重写此方法
     - Parameter 无
     - Returns: 无
     */
    public func requestStarted() {
        //显示提示框
        SVProgressHUD.showWithStatus("加载中")
    }
    
    /**
     请求结束
     - Note: 此方法已实现提示框的处理，如需自定义，请自行重写此方法
     - Parameter 无
     - Returns: 无
     */
    public func requestEnded() {
        if _requestIsSuccess {//请求成功
            //移除提示框
            SVProgressHUD.dismiss()
        } else {//请求失败
            //显示请求失败的提示框
            SVProgressHUD.showErrorWithStatus("请求失败")
        }
    }
    
    /**
     请求成功
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    public func requestSuccess() {
        // Override this method to process the request when request success.
    }
    
    /**
     请求失败
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    public func requestFailure() {
        // Override this method to process the request when request failure.
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

extension UIViewController {
    
    /**
     弹出视图控制器
     - Note: 无
     - Parameter 视图控制器名称
     - Returns: 无
     */
    public func presentViewController(viewControllerToPresent: UIViewController) {
        presentViewController(viewControllerToPresent, animated: true, completion: nil)
    }
    
    /**
     回收视图控制器
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    public func dismissViewController() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
