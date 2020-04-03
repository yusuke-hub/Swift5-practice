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

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func doAction(_ sender: Any) {
        
        carModel.drive()
        
    }
    
}

