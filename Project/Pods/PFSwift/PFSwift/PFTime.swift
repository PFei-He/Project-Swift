//
//  PFTime.swift
//  PFSwift
//
//  Created by PFei_He on 15/11/17.
//  Copyright © 2015年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/PFSwift
//
//  vesion: 0.2.3
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
//  ***** 时间获取和转换 *****
//

import Foundation

public class PFTime: NSObject {
    
    /**
     获取当前时间
     - Note: 时间为标准格式 yyyy-MM-dd HH:mm:ss
     - Parameter 无
     - Returns: 当前时间
     */
    public class func currentTime() -> String {
        return NSDate.stringFromDate(NSDate())
    }
    
    /**
     获取当前时间
     - Note: 无
     - Parameter format: 日期时间格式
     - Returns: 当前时间
     */
    public class func currentTime(format: String) -> String {
        return NSDate.stringFromDate(NSDate(), format: format)
    }
    
    /**
     获取当前时间
     - Note: 无
     - Parameter dateStyle: 日期格式
     - Parameter timeStyle: 时间格式
     - Returns: 当前时间
     */
    public class func currentTime(dateStyle: NSDateFormatterStyle, timeStyle: NSDateFormatterStyle) -> String {
        return NSDate.stringFromDate(NSDate(), dateStyle: dateStyle, timeStyle: timeStyle)
    }
    
    /**
     将时间戳转换为时间
     - Note: 时间为标准格式 yyyy-MM-dd HH:mm:ss
     - Parameter timestamp: 时间戳
     - Returns: 时间
     */
    public class func timeFromTimestamp(timestamp: Double) -> String {
        return NSDate.stringFromDate(NSDate(timeIntervalSince1970: timestamp))
    }
    
    /**
     将时间戳转换为时间
     - Note: 无
     - Parameter timestamp: 时间戳
     - Parameter format: 日期时间格式
     - Returns: 时间
     */
    public class func timeFromTimestamp(timestamp: Double, format: String) -> String {
        return NSDate.stringFromDate(NSDate(timeIntervalSince1970: timestamp), format: format)
    }
    
    /**
     将时间戳转换为时间
     - Note: 无
     - Parameter timestamp: 时间戳
     - Parameter dateStyle: 日期格式
     - Parameter timeStyle: 时间格式
     - Returns: 时间
     */
    public class func timeFromTimestamp(timestamp: Double, dateStyle: NSDateFormatterStyle, timeStyle: NSDateFormatterStyle) -> String {
        return NSDate.stringFromDate(NSDate(timeIntervalSince1970: timestamp), dateStyle: dateStyle, timeStyle: timeStyle)
    }
    
    /**
     获取当前时间戳
     - Note: 无
     - Parameter 无
     - Returns: 当前时间戳
     */
    public class func currentTimestamp() -> String {
        return String(Int(NSDate().timeIntervalSince1970))
    }
    
    /**
     将时间转换为时间戳
     - Note: 时间为标准格式 yyyy-MM-dd HH:mm:ss
     - Parameter time: 时间
     - Returns: 时间戳
     */
    public class func timestampFromTime(time: String) -> String {
        return String(Int(NSDate.dateFromString(time).timeIntervalSince1970))
    }
    
    /**
     将时间转换为时间戳
     - Note: 无
     - Parameter time: 时间
     - Parameter format: 日期时间格式
     - Returns: 时间戳
     */
    public class func timestampFromTime(time: String, format: String) -> String {
        return String(Int(NSDate.dateFromString(time, format: format).timeIntervalSince1970))
    }
    
    /**
     将时间转换为时间戳
     - Note: 无
     - Parameter time: 时间
     - Parameter dateStyle: 日期格式
     - Parameter timeStyle: 时间格式
     - Returns: 时间戳
     */
    public class func timestampFromTime(time: String, dateStyle: NSDateFormatterStyle, timeStyle: NSDateFormatterStyle) -> String {
        return String(Int(NSDate.dateFromString(time, dateStyle: dateStyle, timeStyle: timeStyle).timeIntervalSince1970))
    }
    
    /**
     获取当前时区
     - Note: 无
     - Parameter 无
     - Returns: 当前时区
     */
    public class func currentTimeZone() -> NSTimeZone {
        return NSTimeZone.systemTimeZone()
    }
}
