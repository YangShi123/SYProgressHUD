//
//  ViewController.swift
//  SYProgressHUD
//
//  Created by shiyawn@163.com on 08/06/2021.
//  Copyright (c) 2021 shiyawn@163.com. All rights reserved.
//

import UIKit
import SYProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HUD.showIndicator("这是一个菊花弹窗")
//        HUD.showMsg("这是一个纯文字弹窗")
//        HUD.showSuccess("这是一个成功弹窗")
//        HUD.showFailed("这是一个失败弹窗")
//        var progress: Float = 0.0
//        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
//            progress += 0.005
//            HUD.showProgress("设置一个进度弹窗", progress: progress)
//            if progress >= 1 {
//                timer.invalidate()
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

