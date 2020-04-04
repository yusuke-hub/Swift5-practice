//
//  ViewController.swift
//  Swift5KeyBoard1
//
//  Created by 川端雄介 on 2020/04/03.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

//Appleがパーツに対するメソッドをProtocolとして準備してくれている
//使うために、冒頭で宣言する
class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var logoImageView: UIImageView!
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegateを自分のクラス(UIViewController)に設定
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func login(_ sender: Any) {
        logoImageView.image = UIImage(named: "loginOK")
        userNameLabel.text = userNameTextField.text
        passwordLabel.text = passwordTextField.text
    }
    
    //タッチでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    //キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

