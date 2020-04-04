//
//  ViewController.swift
//  Swift5KeyBoard1
//
//  Created by 川端雄介 on 2020/04/03.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var logoImageView: UIImageView!
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var userNameDisplay: UITextField!
    @IBOutlet var passwordDisplay: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        userNameDisplay = userNameTextField.text
        passwordDisplay = passwordTextField.
    }
    
}

