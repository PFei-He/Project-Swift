//
//  PFDate.swift
//  PFSwift
//
//  Created by PFei_He on 15/11/19.
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
//  ***** NSDate扩展 *****
//

import Foundation

extension NSDate {
    
    ///日期时间格式器
    private class func dateFormatter(format: String?, dateStyle: NSDateFormatterStyle?, timeStyle: NSDateFormatterStyle?) -> NSDateFormatter {
        let formatter = NSDateFormatter()
        if format != nil {
            formatter.dateFormat = format
        } else if dateStyle != nil && timeStyle != nil {
            formatter.dateStyle = dateStyle!
            formatter.timeStyle = timeStyle!
        }
        return formatter;
    }
    
    /**
     将日期时间转换为当前时区日期时间
     - Note: 无
     - Parameter date: 日期时间
     - Returns: 当前时区日期时间
     */
    public class func dateFromCurrentTimeZoneDate(date: NSDate) -> NSDate {
        return date.dateByAddingTimeInterval(Double(PFTime.currentTimeZone().secondsFromGMTForDate(date)))
    }
    
    /**
     将字符串转换为日期时间
     - Note: 时间为标准格式 yyyy-MM-dd HH:mm:ss
     - Parameter string: 时间字符串
     - Returns: 日期时间
     */
    public class func dateFromString(string: String) -> NSDate {
        return NSDate.dateFormatter("yyyy-MM-dd HH:mm:ss", dateStyle: nil, timeStyle: nil).dateFromString(string)!
    }
    
    /**
     将字符串转换为日期时间
     - Note: 无
     - Parameter string: 时间字符串
     - Parameter format: 日期时间格式
     - Returns: 日期时间
     */
    public class func dateFromString(string: String, format: String) -> NSDate {
        return NSDate.dateFormatter(format, dateStyle: nil, timeStyle: nil).dateFromString(string)!
    }
    
    /**
     将字符串转换为日期时间
     - Note: 无
     - Parameter string: 时间字符串
     - Parameter dateStyle: 日期格式
     - Parameter timeStyle: 时间格式
     - Returns: 日期时间
     */
    public class func dateFromString(string: String, dateStyle: NSDateFormatterStyle, timeStyle: NSDateFormatterStyle) -> NSDate {
        return NSDate.dateFormatter(nil, dateStyle: dateStyle, timeStyle: timeStyle).dateFromString(string)!
    }
    
    /**
     将日期时间转换为字符串
     - Note: 时间为标准格式 yyyy-MM-dd HH:mm:ss
     - Parameter date: 日期时间
     - Returns: 时间字符串
     */
    public class func stringFromDate(date: NSDate) -> String {
        return NSDate.dateFormatter("yyyy-MM-dd HH:mm:ss", dateStyle: nil, timeStyle: nil).stringFromDate(date)
    }
    
    /**
     将日期时间转换为字符串
     - Note: 无
     - Parameter date: 日期时间
     - Parameter format: 日期时间格式
     - Returns: 时间字符串
     */
    public class func stringFromDate(date: NSDate, format: String) -> String {
        return NSDate.dateFormatter(format, dateStyle: nil, timeStyle: nil).stringFromDate(date)
    }
    
    /**
     将日期时间转换为字符串
     - Note: 无
     - Parameter date: 日期时间
     - Parameter dateStyle: 日期格式
     - Parameter timeStyle: 时间格式
     - Returns: 时间字符串
     */
    public class func stringFromDate(date: NSDate, dateStyle: NSDateFormatterStyle, timeStyle: NSDateFormatterStyle) -> String {
        return NSDate.dateFormatter(nil, dateStyle: dateStyle, timeStyle: timeStyle).stringFromDate(date)
    }
}
