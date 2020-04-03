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
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        
        stopButton.isEnabled = false
        
        for i in 0..<5 {
            
            print(i)
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
        imageView.image = UIImage(named: "0")
        
    }
//    0.2秒おきに/UIViewControllerクラス自身に対して/timerUpdateと言うセレクターを実行する/繰り返す
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
//    xcodeは以前obkective-cという言語だった名残でこの書き方になった
    @objc func timerUpdate() {
        count = count + 1
        
        if count > 4 {
            
            count = 0
            
        }
        imageView.image = imageArray[count]
    }

    @IBAction func start(_ sender: Any) {

        startButton.isEnabled = false
        
        stopButton.isEnabled = true
        
        startTimer()
    }
    
    @IBAction func stop(_ sender: Any) {

        stopButton.isEnabled = false
        
        startButton.isEnabled = true


        
        timer.invalidate()
        
    }
}

