//
//  Scanner.swift
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
//  ***** 扫描器 *****
//

import Foundation
import UIKit
import AVFoundation

///调试模式
private var DEBUG_MODE = false
///调试目标
private var DEBUG_TARGET = ""

public protocol ScannerDelegate: NSObjectProtocol {
    
    /**
     扫描完成
     - Note: 无
     - Parameter string: 扫描结果转换成的字符串
     - Returns: 无
     */
    func scanner(scanner: Scanner, captureCompletedWithString string: String)
}

public class Scanner: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    
    /* 详见AVCaptureOutput类的rectOfInterest */
    ///扫描器的工作区域
    public var rectOfInterest:  CGRect {
        get {
            return _rectOfInterest
        } set {
            _rectOfInterest = newValue
        }
    }
    private var _rectOfInterest: CGRect!
    
    ///代理
    weak public var delegate:   ScannerDelegate?
    
    ///输入
    private var input:          AVCaptureInput!
    ///输出
    private var output:         AVCaptureMetadataOutput!
    ///拍摄会话
    private var session:        AVCaptureSession!
    ///预览
    private var previewLayer:   AVCaptureVideoPreviewLayer!
    
    // MARK: - Life Cycle
    
    //初始化
    public override init() {
        super.init()
        //设置输出（Metadata元数据）
        output = AVCaptureMetadataOutput()
    }
    
    // MARK: - Public Methods
    
    /**
     创建扫描器
     - Note: 无
     - Parameter view: 添加扫描器的视图
     - Returns: 无
     */
    public func createInView(view: UIView) {
        
        //实例化摄像头设备
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        do {
            //设置输入，把摄像头作为输入设备
            input = try AVCaptureDeviceInput(device: device)
        } catch {
            if DEBUG_MODE {
                print("[ \(DEBUG_TARGET) ][ ERROR ] Device input error.")
            }
        }
        
        //设置输出的代理
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        //拍摄会话
        session = AVCaptureSession()
        
        //设置拍摄质量
        session.sessionPreset = AVCaptureSessionPresetHigh
        
        //添加输入
        if session.canAddInput(input) {
            session.addInput(input)
        }
        
        //添加输出
        if session.canAddOutput(output) {
            session.addOutput(output)
        }
        
        /**
         * p.s. 由于苹果的API设置问题，必须先将输出（AVCaptureMetadataOutput）添加到会话（AVCaptureSession），再对输出的元数组对象类型（metadataObjectTypes）进行设置
         */
        //设置输出的格式
        output.metadataObjectTypes = [AVMetadataObjectTypeCode128Code,
                                      AVMetadataObjectTypeCode39Code,
                                      AVMetadataObjectTypeCode39Mod43Code,
                                      AVMetadataObjectTypeCode93Code,
                                      AVMetadataObjectTypeEAN13Code,
                                      AVMetadataObjectTypeEAN8Code,
                                      AVMetadataObjectTypeQRCode]
        
        //设置预览
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        previewLayer.frame = view.bounds
        
        //将预览添加到当前视图
        view.layer.addSublayer(previewLayer)
        
        //开始会话
        session.startRunning()
    }
    
    /**
     调试模式
     - Note: 无
     - Parameter openOrNot: 是否打开调试模式
     - Parameter target: 调试目标
     - Returns: 无
     */
    public class func debugMode(openOrNot: Bool, debugTarget terget: String) {
        DEBUG_MODE = openOrNot
        DEBUG_TARGET = terget
    }
    
    // MARK: - AVCaptureMetadataOutputObjectsDelegate Methods
    
    public func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        //扫描完成，停止会话
        session.stopRunning()
        
        //删除预览
        previewLayer.removeFromSuperlayer()
        
        //获取扫描结果
        if metadataObjects.count > 0 {
            let object = metadataObjects[0]
            if delegate != nil {
                delegate?.scanner(self, captureCompletedWithString: object.stringValue)
            }
        }
    }
}
