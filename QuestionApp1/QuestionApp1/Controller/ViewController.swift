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
    
    let images = ImagesList()
    
    // IBActionで検知した正答がどちらなのかを取得する変数
    var pickedAnswer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1{
            
            pickedAnswer = true
            // 丸ボタンが押された時
            
            // ユーザーが押したボタンが丸ボタンだった
            // 丸ボタンの音声を流す
            
        }else if ( sender as AnyObject).tag == 2{
            pickedAnswer = false
            // ×ボタンが押された時
            // ユーザーが押したボタンが×ボタンだった
            // ×ボタンの音声をながす
        }
        // 回答があっているか(pickedAnswerとImagesListのcorrectOrNotの値が一致しているかどうか）
    }
    
}

