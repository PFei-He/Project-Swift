//
//  PFAlertView.swift
//  PFSwift
//
//  Created by PFei_He on 15/12/4.
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
//  ***** UIAlertView扩展 *****
//

import UIKit

extension UIAlertView {
    
    /**
     显示警告
     - Note: 无
     - Parameter titles: 所有的标题，第0个为警告的标题，其余为按钮标题
     - Parameter message: 提示内容
     - Parameter target: 执行方法的对象
     - Returns: 无
     */
    public class func show(titles: Array<String>, message: String?, target: AnyObject?) {
        let alertView = UIAlertView()
        alertView.title = titles[0]
        alertView.message = message
        alertView.delegate = target
        if titles.count > 1 {
            for string in titles[1...titles.endIndex-1] {
                alertView.addButtonWithTitle(string)
            }
        }
        alertView.show()
    }
}
