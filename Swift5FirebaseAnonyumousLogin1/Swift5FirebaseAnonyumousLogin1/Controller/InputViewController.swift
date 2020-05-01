//
//  InputViewController.swift
//  Swift5FirebaseAnonyumousLogin1
//
//  Created by 川端雄介 on 2020/05/01.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.layer.cornerRadius = 30.0

    }
    
    override func viewWillAppear(_ animated: Bool) {
        // デフォルトでtrue
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }


    @IBAction func done(_ sender: Any) {
        // ユーザー名をアプリ内に保存
        UserDefaults.standard.set(userNameTextField.text, forKey: "userName")
        // アイコンをアプリ内に保存
        // 画像を10分の1に圧縮する
        let data = logoImageView.image?.jpegData(compressionQuality: 0.1)
        UserDefaults.standard.set(data, forKey: "userImage")
        
        // 画面遷移
        let nextVC = self.storyboard?.instantiateViewController(identifier: "nextVC") as! NextViewController 
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
