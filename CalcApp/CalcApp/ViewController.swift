//
//  ViewController.swift
//  CalcApp
//
//  Created by 川端雄介 on 2020/04/03.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var carModel = Car()
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        carModel.frontwheel = 10
        carModel.rearwheel = 10
        
        count = 10
    }

    @IBAction func doAction(_ sender: Any) {
        
        carModel.drive()
        carModel.move(toBack: "後ろに行くよ!")
        let total = carModel.plusAndMinus(num1: carModel.frontwheel, num2: carModel.rearwheel)
        print("タイヤの合計数 \(total)")
        
    }
    
}

