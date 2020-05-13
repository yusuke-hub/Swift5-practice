//
//  RegisterViewController.swift
//  Swift5FirebaseAnonyumousLogin1
//
//  Created by 川端雄介 on 2020/05/01.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func login(_ sender: Any) {
        // annonymous:匿名の
        Auth.auth().signInAnonymously { (authResule, error) in
            // authResultの中に入ってくるレスポンスのuserを入れる
            let user = authResule?.user
            print(user)
            
            // 画面遷移
            // RegisterViewControllerクラスで、InputViewControllerの画面はinputVCというIDで管理されており、それをinputVCという変数に置き換えている
            let inputVC = self.storyboard?.instantiateViewController(identifier: "inputVC") as! InputViewController
            
            self.navigationController?.pushViewController(inputVC, animated: true)
        }
    }
    


}
