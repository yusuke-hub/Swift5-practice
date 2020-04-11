//
//  ViewController.swift
//  QuestionApp2
//
//  Created by 川端雄介 on 2020/04/11.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var maxScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1{
            // ◯ボタンが押された時
            
            // ユーザーが押したボタンが○ボタンだった
            
            // ○ボタンの音声を流す
        }else if (sender as AnyObject).tag == 2{
            // ×ボタンが押された時
            
            // ユーザーが押したボタンが×だった
            
            // ×ボタンの音声を流す
        }
        
    }
    
    
}

