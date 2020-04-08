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
    
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    let imagesList = ImagesList()
    
    // IBActionで検知した正答がどちらなのかを取得する変数
    var pickedAnswer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)
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
        func check(){
            let correctAnswer = imagesList.list[0].answer
            if correctAnswer == pickedAnswer{
                print("正解")
                correctCount = correctCount + 1
            }else{
                print("間違い")
                wrongCount = wrongCount + 1
            }
            
        }
        func nextQuestions(){
            if questionNumber <= 9{
                questionNumber = questionNumber + 1
                imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
            }else{
                print("問題終了")
                performSegue(withIdentifier: "next", sender: nil)
            }
        }
        prepareForInterfaceBuilder()
    }
    
}

