//
//  ViewController.swift
//  Swift5WKWebView1
//
//  Created by 川端雄介 on 2020/04/04.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
// 元々はUIKitに含まれていた
import WebKit

class ViewController: UIViewController {
    
    var webview = WKWebView()
    // 読み込みが完了するまで、くるくる回る
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var go: UIToolbar!
    
    @IBOutlet var back: UIToolbar!
}

