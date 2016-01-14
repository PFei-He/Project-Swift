//
//  GuideViewController.swift
//  Project
//
//  Created by PFei_He on 16/1/12.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/Project-Swift
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
//  ***** 引导页 *****
//

import UIKit

class GuideViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView:      UIScrollView!
    @IBOutlet weak var pageControl:     UIPageControl!
    @IBOutlet weak var button:          UIButton!
    @IBOutlet weak var viewWidth:       NSLayoutConstraint!
    @IBOutlet weak var imageViewWidth1: NSLayoutConstraint!
    @IBOutlet weak var imageViewWidth2: NSLayoutConstraint!
    @IBOutlet weak var imageViewWidth3: NSLayoutConstraint!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewWidth.constant = UIScreen.mainScreen().bounds.width*3
        imageViewWidth1.constant = UIScreen.mainScreen().bounds.width
        imageViewWidth2.constant = UIScreen.mainScreen().bounds.width
        imageViewWidth3.constant = UIScreen.mainScreen().bounds.width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Events Management

    @IBAction func enter(sender: AnyObject?) {
        let viewController = Initialization.initLaunch()
        presentViewController(viewController, animated: true, completion: nil)
    }
    
    // MARK: - UIScrollViewDelegate Methods

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / UIScreen.mainScreen().bounds.width)
        if currentPage == 2 {
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                self.button.layer.opacity = 1
            })
        } else {
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.button.layer.opacity = 0
            })
        }
        pageControl.currentPage = currentPage
    }
}
