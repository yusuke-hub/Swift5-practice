//
//  NextViewController.swift
//  QuestionApp1
//
//  Created by 川端雄介 on 2020/04/07.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
protocol NowScoreDelegate {
    func nowScore(score: Int)
}

class NextViewController: UIViewController {

    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var wrongLabel: UILabel!
    
    var correctCount = Int()
    var wrongCount = Int()
    var beforeCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctLabel.text = String(correctCount)
        wrongLabel.text = String(wrongCount)
        // Do any additional setup after loading the view.
    }

    
    @IBAction func back(_ sender: Any) {
        if beforeCount < correctCount{
            UserDefaults.standard.set(correctCount, forKey: beforeCount)
            delegate?.mowScore(score: correctCount)
        }
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
