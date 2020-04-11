//
//  ViewController.swift
//  QuestionApp2
//
//  Created by 川端雄介 on 2020/04/11.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

// ViewControllerはUIViewControllerクラスを継承したもの
class ViewController: UIViewController,NowScoreDelegate {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var maxScoreLabel: UILabel!
    
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    let imagesList = ImagesList()
    
    // IBActionで検知した正答がどちらなのかを取得する変数
    var pickedAnswer = false
    
    var soundFile = SoundFile()
    
    var withOutMP3 = WithOutMP3()
    
    var changeColor = ChangeColor()
    
    var gradientLayer = CAGradientLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.26, topAlpha: 1.0, bottomR: 0.54, bottomG: 0.74, bottomB: 0.74, bottomAlpha: 1.0)
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        imageView.layer.cornerRadius = 50.0
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }

        maxScoreLabel.text = String(maxScore)
    }

    @IBAction func answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1{
            
            soundFile.playSound(fileName: "maruSound", extensionName: "mp3")
            pickedAnswer = true
            
            // ◯ボタンが押された時
            
            // ユーザーが押したボタンが○ボタンだった
            
            // ○ボタンの音声を流す
        }else if (sender as AnyObject).tag == 2{
            soundFile.playSound(fileName: "batsuSound", extensionName: "mp3")
            pickedAnswer = false
            // ×ボタンが押された時
            
            // ユーザーが押したボタンが×だった
            
            // ×ボタンの音声を流す
        }
        // 回答があっているか(pickedAnswerとImagesListのcorrectOrNotの値が一致しているかどうか)
        check()
        nextQuestions()
        
    }
    
    func check(){
        let correctAnswer = imagesList.list[questionNumber].answer
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
            // 画面遷移
            performSegue(withIdentifier: "next", sender: nil)
        }
    }

    func nowScore(score: Int) {
        soundFile.playSound(fileName: "Sound", extensionName: "mp3")
        maxScoreLabel.text = String(score)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as! NextViewController
            nextVC.correctedCount = correctCount
            nextVC.wrongCount = wrongCount
            nextVC.delegate = self
        }
    }
    
}

			
