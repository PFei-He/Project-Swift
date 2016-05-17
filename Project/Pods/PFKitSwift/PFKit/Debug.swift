//
//  Debug.swift
//  PFKit
//
//  Created by PFei_He on 16/5/12.
//  Copyright © 2016年 PFei_He. All rights reserved.
//
//  https://github.com/PFei-He/PFKitSwift
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
//  ***** 调试 *****
//

import Foundation

public class Debug: NSObject {

    /**
     版本信息
     - Note: 无
     - Parameter 无
     - Returns: 无
     */
    public class func debugVersion() {
        print("[ PFKit ][ INFO ] THANK YOU FOR USING !!")
        print("[ PFKit ][ INFO ] Current version: 0.0.8.")
        print("[ PFKit ][ INFO ] Programming language: Swift.")
        print("[ PFKit ][ INFO ] Open source license: MIT.")
        print("[ PFKit ][ INFO ] Join me: https://github.com/PFei-He/PFKitSwift.")
    }
    
    /**
     调试模式
     - Note: 无
     - Parameter openOrNot: 是否打开调试模式
     - Returns: 无
     */
    public class func debugMode(openOrNot: Bool) {
        File.debugMode(openOrNot, debugTarget: "PFKit")
        Model.debugMode(openOrNot, debugTarget: "PFKit")
        Scanner.debugMode(openOrNot, debugTarget: "PFKit")
    }
    
    /**
     调试模式
     - Note: 无
     - Parameter openOrNot: 是否打开调试模式
     - Parameter target: 调试目标
     - Returns: 无
     */
    public class func debugMode(openOrNot: Bool, debugTarget target: String) {
        File.debugMode(openOrNot, debugTarget: target)
        Model.debugMode(openOrNot, debugTarget: target)
        Scanner.debugMode(openOrNot, debugTarget: target)
    }
}
