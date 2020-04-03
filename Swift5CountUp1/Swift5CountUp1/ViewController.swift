//
//  ViewController.swift
//  Swift5CountUp1
//
//  Created by 川端雄介 on 2020/04/03.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countUpLabel: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countUpLabel.text = "0"
    }

    @IBAction func plus(_ sender: Any) {
        count = count + 1
        countUpLabel.text = String(count)
    }
    
    @IBAction func minus(_ sender: Any) {
        count = count - 1
        countUpLabel.text = String(count)
    }
    
    func changeTextColor(){
        countUpLabel.textColor = .yellow
    }
    
    func resetColor(){
        countUpLabel.textColor = .white
    }
}

