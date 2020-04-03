//
//  ViewController.swift
//  Swift5Timer1
//
//  Created by 川端雄介 on 2020/04/03.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var stopButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        
        stopButton.isEnabled = true
        
    }
//    0.2秒おきに/UIViewControllerクラス自身に対して/timerUpdateと言うセレクターを実行する/繰り返す
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
//    xcodeは以前obkective-cという言語だった名残でこの書き方になった
    @objc func timerUpdate() {
        count = count + 1
        imageView.image = UIImage(named: "0")
    }

    @IBAction func start(_ sender: Any) {
//        スタートボタンを押せなくする
        startButton.isEnabled = true
    }
    
    @IBAction func stop(_ sender: Any) {
//        ストップボタンを押せなくする
        stopButton.isEnabled = true
//        スタートボタンを押せるようにする
        startButton.isEnabled = false
    }
}

