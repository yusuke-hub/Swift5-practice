//
//  ViewController.swift
//  Swift5FacebookLoginWithFirebase1
//
//  Created by 川端雄介 on 2020/04/16.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin
import Firebase

class ViewController: UIViewController,LoginButtonDelegate {
    
    let fbLoginButton:FBLoginButton = FBLoginButton()
    var displayName = String()
    var pictureURL = String()
    var pictureURLString = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fbLoginButton.delegate = self
        // x軸方向の距離をなぜ直接Viewの幅の4分の１と指定しないのか
        fbLoginButton.frame = CGRect(x: view.frame.size.width/2 - view.frame.size.width/4, y: view.frame.size.width/4, width: view.frame.size.width/2, height: 30)
        //
        fbLoginButton.permissions = ["public_profile,email"]
        view.addSubview(fbLoginButton)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            
        if error == nil{
            
            // キャンセルボタンが押された時
            if result?.isCancelled == true{
            
                return
                
            }
        }
        
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        Auth.auth().signIn(with: credential) { (result, error) in
            
            // もしエラーがあれば
            if let error = error{
            
                return
            }
            
            self.displayName = result!.user.displayName!
            // photoURLでとれたURL型の値をString型に強制変換する
            self.pictureURLString = result!.user.photoURL!.absoluteString
            UserDefaults.standard.set(1, forKey: "loginOK")
            UserDefaults.standard.set(self.displayName, forKey: "displayName")
            UserDefaults.standard.set(self.pictureURLString, forKey: "pictureURLString")

        }
    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }

}

