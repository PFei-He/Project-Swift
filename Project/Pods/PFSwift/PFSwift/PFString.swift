//
//  PFString.swift
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
//  ***** String扩展 *****
//

import Foundation

extension String {
    
    /**
     判断是否QQ号码
     - Note: 无
     - Parameter 无
     - Returns: 判断结果
     */
    public func isQQ() -> Bool {
        let regex = "(^[0-9]*$)"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluateWithObject(self)
    }
    
    /**
     判断是否邮箱地址
     - Note: 无
     - Parameter 无
     - Returns: 判断结果
     */
    public func isEmail() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluateWithObject(self)
    }
    
    /**
     判断是否URL
     - Note: 无
     - Parameter 无
     - Returns: 判断结果
     */
    public func isURL() -> Bool {
        let regex = "(http[s]{0,1}|ftp):\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluateWithObject(self)
    }
    
    /**
     判断是否手机号码
     - Note: 无
     - Parameter 无
     - Returns: 判断结果
     */
    public func isMobilePhoneNumber() -> Bool {
        let regexMobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let regexCM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let regexCU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let regexCT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regexPHS = "^0(10|2[0-5789]|\\d{3})\\d{7,8}$"
        
        let predicateMobile = NSPredicate(format: "SELF MATCHES %@", regexMobile)
        let predicateCM = NSPredicate(format: "SELF MATCHES %@", regexCM)
        let predicateCU = NSPredicate(format: "SELF MATCHES %@", regexCU)
        let predicateCT = NSPredicate(format: "SELF MATCHES %@", regexCT)
        let predicatePHS = NSPredicate(format: "SELF MATCHES %@", regexPHS)
        
        return predicateMobile.evaluateWithObject(self) ||
            predicateCM.evaluateWithObject(self) ||
            predicateCU.evaluateWithObject(self) ||
            predicateCT.evaluateWithObject(self) ||
            predicatePHS.evaluateWithObject(self)
    }
    
    /**
     匹配邮箱地址
     - Note: 无
     - Parameter string: 需要匹配的字符串
     - Returns: 寻找出的邮箱地址
     */
    public func matchesEmail(string: String) -> String {
        let regulaStr = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let regex = try? NSRegularExpression(pattern: regulaStr, options: NSRegularExpressionOptions.CaseInsensitive)
        let arrayOfAllMatches = regex?.matchesInString(string, options: NSMatchingOptions.ReportProgress, range: NSMakeRange(0, string.characters.count))
        
        var matchesStr: String?
        for match in arrayOfAllMatches! {
            matchesStr = (string as NSString).substringWithRange(match.range)
        }
        return matchesStr!
    }
    
    /**
     匹配URL
     - Note: 无
     - Parameter string: 需要匹配的字符串
     - Returns: 寻找出的URL
     */
    public func matchesURL(string: String) -> String {
        let regulaStr = "(http[s]{0,1}|ftp):\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?"
        let regex = try? NSRegularExpression(pattern: regulaStr, options: NSRegularExpressionOptions.CaseInsensitive)
        let arrayOfAllMatches = regex?.matchesInString(string, options: NSMatchingOptions.ReportProgress, range: NSMakeRange(0, string.characters.count))
        
        var matchesStr: String?
        for match in arrayOfAllMatches! {
            matchesStr = (string as NSString).substringWithRange(match.range)
        }
        return matchesStr!
    }
}

extension String {
    
    /**
     本地化
     - Note: 无
     - Parameter 无
     - Returns: 当前语言环境对应的值
     */
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    
    /**
     本地化带注释
     - Note: 无
     - Parameter comment: 本地化文件中的注释
     - Returns: 当前语言环境对应的值
     */
    public func localizedWithComment(comment: String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: comment)
    }
}
