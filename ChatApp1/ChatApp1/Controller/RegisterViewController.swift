//
//  RegisterViewController.swift
//  ChatApp1
//
//  Created by 川端雄介 on 2020/04/18.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import Firebase
// 色んなアニメーションを簡単に使用できる
import Lottie

class RegisterViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func registerNewUser(_ sender: Any) {
        
        // アニメーションの開始
        
        // 新規登録
        
        // 画面をチャット画面に遷移させる
          // AuthはFirebaseに入ってるライブラリ, AuthResultDataCallbackを選択、enterとするとクロージャーの形になる
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil{
                
                print(error as Any)
                
            }else{
                
                print("ユーザーの作成が成功しました！")
                
                // アニメーションの停止
                //クロージャーの中で使用する関数は所属を明示的に表す為,selfが必要となる
                self.stopAnimation()
                // チャット画面に遷移させる
                self.performSegue(withIdentifier: "chat", sender: nil)
                
            }
        }
    }
    
    func startAnimation(){
        
        let animation = Animation.named("loading")
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/1.5)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        view.addSubview(animationView)
    }
    
    func stopAnimation(){
        
        animationView.removeFromSuperview()
        
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
