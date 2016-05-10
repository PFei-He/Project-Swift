//
//  PFView.swift
//  PFSwift
//
//  Created by PFei_He on 15/11/17.
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
//  ***** UIView扩展 *****
//

import UIKit

extension UIView {
    
    // MARK: - ORIGIN
    
    ///坐标
    public var origin: CGPoint {
        get {
            return frame.origin
        } set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    ///X坐标
    public var x: CGFloat {
        get {
            return frame.origin.x
        } set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    ///Y坐标
    public var y: CGFloat {
        get {
            return frame.origin.y
        } set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    // MARK: - SIZE
    
    ///尺寸
    public var size: CGSize {
        get {
            return frame.size
        } set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    ///宽
    public var width: CGFloat {
        get {
            return frame.width
        } set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    ///高
    public var height: CGFloat {
        get {
            return frame.height
        } set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    //MARK: - POSITION
    
    ///方位
    public var position: CGPoint {
        get {
            return frame.origin
        } set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    ///上边缘
    public var top: CGFloat {
        get {
            return frame.origin.y
        } set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    ///左边缘
    public var left: CGFloat {
        get {
            return frame.origin.x
        } set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    ///下边缘
    public var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        } set {
            var frame = self.frame
            frame.origin.y = newValue - frame.size.height
            self.frame = frame
        }
    }
    
    ///右边缘
    public var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        } set {
            var frame = self.frame
            frame.origin.x = newValue - frame.size.width
            self.frame = frame
        }
    }
    
    // MARK: - CENTER
    
    ///中心点
    public var boundsCenter: CGPoint {
        get {
            return CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds))
        }
    }
    
    ///中心点的X坐标
    public var centerX: CGFloat {
        get {
            return center.x
        } set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    ///中心点的Y坐标
    public var centerY: CGFloat {
        get {
            return center.y
        } set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    // MARK: - OFFSET
    
    ///位移
    public var offset: CGPoint {
        get {
            var point = CGPointZero
            var view = self
            point.x += view.frame.origin.x
            point.y += view.frame.origin.y
            view = view.superview!
            return point
        } set {
            var view = self
            var point = newValue
            point.x += view.superview!.frame.origin.x
            point.y += view.superview!.frame.origin.y
            view = view.superview!
            
            var frame = self.frame
            frame.origin = point
            self.frame = frame
        }
    }
}
