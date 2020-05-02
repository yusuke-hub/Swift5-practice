//
//  EditAndPostViewController.swift
//  Swift5FirebaseAnonyumousLogin1
//
//  Created by 川端雄介 on 2020/05/02.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class EditAndPostViewController: UIViewController {
    
    var passedImage = UIImage()
    
    var userName = String()
    var userImageString = String()
    var userImageData = Data()
    var userImage = UIImage()

    @IBOutlet var userProfileImageView: UIImageView!
    
    @IBOutlet var userNameLabel: UILabel!

    @IBOutlet var contentImageView: UIImageView!
    @IBOutlet var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // アプリ内に保存されているデータを呼び出して、Viewに表示させる
        if UserDefaults.standard.object(forKey: "userName") != nil {
            
            userName =  UserDefaults.standard.object(forKey: "userName") as! String
        }
        if UserDefaults.standard.object(forKey: "userImage") != nil {
            
            userImageData =  UserDefaults.standard.object(forKey: "userImage") as! Data
            userImage = UIImage(data: userImageData)!
        }
        if UserDefaults.standard.object(forKey: "userImage") != nil {
            
            userImageData =  UserDefaults.standard.object(forKey: "userImage") as! Data
            userImage = UIImage(data: userImageData)!
        }

        userNameLabel.text = userName
        userProfileImageView.image = userImage
        contentImageView.image = passedImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
