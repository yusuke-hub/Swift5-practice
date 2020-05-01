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
            let user = authResule?.user
            print(user)
        }
    }
    


}
