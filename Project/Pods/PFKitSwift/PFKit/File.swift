//
//  File.swift
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
//  ***** 文件操作 *****
//

import Foundation

///调试模式
private var DEBUG_MODE = false
///调试目标
private var DEBUG_TARGET = ""

public class File: NSObject {

    // MARK: - Public Methods

    /**
     创建文件
     - Note: 文件存放于沙盒中的Documents文件夹中
     - Parameter fileName: 文件名
     - Returns: 无
     */
    public class func createWithName(fileName: String) {
        let path = readWithName(fileName, directory: "document", type: nil) as! String
        let manager = NSFileManager.defaultManager()
        if !manager.fileExistsAtPath(path) {//如果文件不存在则创建文件
            let result = manager.createFileAtPath(path, contents:nil, attributes:nil)
            modifyWithName(fileName, setParams: Dictionary<String, AnyObject>())
            if result && DEBUG_MODE {
                print("[ \(DEBUG_TARGET) ][ DEBUG ] File created.")
                print("[ \(DEBUG_TARGET) ][ DEBUG ] File path: \(path).")
            } else if DEBUG_MODE {
                print("[ \(DEBUG_TARGET) ][ ERROR ] File create failed.")
            }
        } else if DEBUG_MODE {
            print("[ \(DEBUG_TARGET) ][ ERROR ] File exists.")
            print("[ \(DEBUG_TARGET) ][ DEBUG ] File path: \(path).")
        }
    }
    
    /**
     创建文件
     - Note: 文件存放于沙盒中的Documents文件夹中
     - Parameter fileName: 文件名
     - Parameter params: 写入的参数
     - Returns: 无
     */
    public class func createWithName(fileName: String, params: Dictionary<String, AnyObject>) {
        let path = readWithName(fileName, directory: "document", type: nil) as! String
        let manager = NSFileManager.defaultManager()
        if !manager.fileExistsAtPath(path) {//如果文件不存在则创建文件
            let result = manager.createFileAtPath(path, contents:nil, attributes:nil)
            modifyWithName(fileName, setParams: params)
            if result && DEBUG_MODE {
                print("[ \(DEBUG_TARGET) ][ DEBUG ] File created.")
                print("[ \(DEBUG_TARGET) ][ DEBUG ] File path: \(path).")
            } else if DEBUG_MODE {
                print("[ \(DEBUG_TARGET) ][ ERROR ] File create failed.")
            }
        } else if DEBUG_MODE {
            print("[ \(DEBUG_TARGET) ][ ERROR ] File exists.")
            print("[ \(DEBUG_TARGET) ][ DEBUG ] File path: \(path).")
        }
    }
    
    /**
     读取Dictionary类型文件
     - Note: 文件存放于沙盒中的Documents文件夹中
     - Parameter fileName: 文件名
     - Returns: 文件中的数据
     */
    public class func readDictionaryWithName(fileName: String) -> Dictionary<String, AnyObject> {
        let string = readWithName(fileName, directory: "document", type: nil) as! String
        let dictionary = Dictionary<String, AnyObject>()
        if string != "" {
            var dictionary = NSDictionary(contentsOfFile: string) as! Dictionary<String, AnyObject>
            dictionary.removeValueForKey("")
            return dictionary
        } else {
            if DEBUG_MODE {
                print("[ \(DEBUG_TARGET) ][ DEBUG ] Dictionary file has not parameter.")
                print("[ \(DEBUG_TARGET) ][ ERROR ] Read dictionary file failed.")
            }
            return dictionary
        }
    }
    
    /**
     读取String类型文件
     - Note: 文件存放于沙盒中的Documents文件夹中
     - Parameter fileName: 文件名
     - Returns: 文件中的数据
     */
    public class func readStringWithName(fileName: String) -> String {
        var dictionary = NSDictionary(contentsOfFile: readWithName(fileName, directory: "document", type: nil) as! String) as! Dictionary<String, AnyObject>
        dictionary.removeValueForKey("")
        var result = String()
        do {
            result = try String(contentsOfFile: readWithName(fileName, directory: "document", type: nil) as! String, encoding: NSUTF8StringEncoding)
        } catch {
            if DEBUG_MODE {
                print("[ \(DEBUG_TARGET) ][ DEBUG ] String file has not parameter.")
                print("[ \(DEBUG_TARGET) ][ ERROR ] Read string file failed.")
            }
        }
        return result
    }
    
    /**
     读取JSON类型文件
     - Note: 文件存放于main bundle中
     - Parameter fileName: 文件名
     - Returns: 文件中的数据
     */
    public class func readJSONWithName(fileName: String) -> NSData {
        return readWithName(fileName, directory: "bundle", type: "json") as! NSData
    }
    
    /**
     读取XML类型文件
     - Note: 文件存放于main bundle中
     - Parameter fileName: 文件名
     - Returns: 文件中的数据
     */
    public class func readXMLWithName(fileName: String) -> NSData {
        return readWithName(fileName, directory: "bundle", type: "xml") as! NSData
    }
    
    /**
     读取文件的路径
     - Note: 文件存放于沙盒中的Documents文件夹中
     - Parameter fileName: 文件名
     - Returns: 文件路径
     */
    public class func readPathWithName(fileName: String) -> String {
        return readWithName(fileName, directory: "document", type: nil) as! String
    }
    
    /**
     写入文件
     - Note: 文件存放于沙盒中的Documents文件夹中
     - Parameter fileName: 文件名
     - Parameter params: 写入到文件的参数
     - Returns: 写入结果
     */
    public class func modifyWithName(fileName: String, setParams params: Dictionary<String, AnyObject>) -> Bool {
        return (params as NSDictionary).writeToFile(File.readWithName(fileName, directory: "document", type: nil) as! String, atomically: true)
    }
    
    /**
     添加参数
     - Note: 文件存放于沙盒中的Documents文件夹中
     - Parameter fileName: 文件名
     - Parameter params: 添加到文件的参数
     - Returns: 写入结果
     */
    public class func modifyWithName(fileName: String, addParams params: Dictionary<String, AnyObject>) -> Bool {
        var dictionary = readDictionaryWithName(fileName)
        dictionary.removeValueForKey("")
        dictionary.addEntries(params)
        return File.modifyWithName(fileName, setParams: dictionary)
    }
    
    /**
     创建文件
     - Note: 文件存放于沙盒中的Documents文件夹中
     - Parameter fileName: 文件名
     - Returns: 无
     */
    public class func removeWithName(fileName: String) {
        let path = readWithName(fileName, directory: "document", type: nil) as! String
        let manager = NSFileManager.defaultManager()
        if manager.fileExistsAtPath(path) {//如果文件存在则删除文件
            do {
                try manager.removeItemAtPath(path)
                if DEBUG_MODE {
                    print("[ \(DEBUG_TARGET) ][ DEBUG ] File removed.")
                }
            } catch {
                if DEBUG_MODE {
                    print("[ \(DEBUG_TARGET) ][ ERROR ] File remove failed.")
                }
            }
        } else if DEBUG_MODE {
            print("[ \(DEBUG_TARGET) ][ ERROR ] File does not exist.")
        }
    }
    
    /**
     调试模式
     - Note: 无
     - Parameter openOrNot: 是否打开调试模式
     - Parameter target: 调试目标
     - Returns: 无
     */
    public class func debugMode(openOrNot: Bool, debugTarget target: String) {
        DEBUG_MODE = openOrNot
        DEBUG_TARGET = target
    }
    
    // MARK: - Private Methods
    
    ///读取资源包文件或沙盒文件
    private class func readWithName(fileName: String, directory: String, type: String?) -> AnyObject {
        if directory == "bundle" {//资源包文件
            let path = NSBundle.mainBundle().pathForResource(fileName, ofType: type)
            var string = String()
            do {
                string = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
            } catch {
                if DEBUG_MODE {
                    print("[ \(DEBUG_TARGET) ][ ERROR ] Read file failed.")
                }
            }
            return string.dataUsingEncoding(NSUTF8StringEncoding)!
        } else {//沙盒文件
            let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
            let path = NSURL(fileURLWithPath: paths[0]).URLByAppendingPathComponent(fileName)
            return path.path!
        }
    }
}
