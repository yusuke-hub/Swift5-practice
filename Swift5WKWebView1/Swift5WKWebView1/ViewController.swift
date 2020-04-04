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
    
    var webView = WKWebView()
    // 読み込みが完了するまで、くるくる回る
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    @IBOutlet var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = CGRect(x: 0, y: toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.width - toolBar.frame.size.height*2)
        view.addSubview(webView)
    }

    @IBAction func go(_ sender: Any) {
    }
    
    @IBAction func back(_ sender: Any) {
    }
}

