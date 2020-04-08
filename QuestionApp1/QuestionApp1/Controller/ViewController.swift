//
//  ViewController.swift
//  QuestionApp1
//
//  Created by 川端雄介 on 2020/04/07.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Controllerのフォルダ名を間違っていたために、紐付けができていなかった
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var maxScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1{
            // 丸ボタンが押された時
            
            // ユーザーが押したボタンが丸ボタンだった
            // 丸ボタンの音声を流す
            
        }else if ( sender as AnyObject).tag == 2{
            // ×ボタンが押された時
            // ユーザーが押したボタンが×ボタンだった
            // ×ボタンの音声をながす
        }
    }
    
}

