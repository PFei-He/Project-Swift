//
//  PFTimer.swift
//  PFSwift
//
//  Created by PFei_He on 15/11/24.
//  Copyright © 2015年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/PFSwift
//
//  vesion: 0.4.0
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
//  ***** NSTimer扩展 *****
//

import Foundation

extension NSTimer {
    
    /**
     暂停计时器
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    public func pause() {
        if !valid {//若计时器无效则返回
            return;
        }
        //设置计时器运行时间为未来时间，则暂停了计时器
        fireDate = NSDate.distantFuture()
    }
    
    /**
     恢复计时器
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    public func resume() {
        if !valid {//若计时器无效则返回
            return;
        }
        //设置计时器运行时间为当前时间，则立即运行计时器
        fireDate = NSDate()
    }
    
    /**
     指定时间间隔后恢复计时器
     - Note: 无
     - Parameter timeInterval: 时间间隔
     - Returns: 无
     */
    public func resumeAfterTimeInterval(timeInterval: NSTimeInterval) {
        if !valid {//若计时器无效则返回
            return;
        }
        //设置计时器运行时间为指定的间隔时长
        fireDate = NSDate(timeIntervalSinceNow: timeInterval)
    }
}
