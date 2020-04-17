//
//  NextViewController.swift
//  Swift5FacebookLoginWithFirebase1
//
//  Created by 川端雄介 on 2020/04/16.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
// キャッシュを取って、画像を表示する
import SDWebImage

class NextViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.objectIsForced(forKey: "pictureURLString") != nil || (UserDefaults.standard.objectIsForced(forKey: "displayName") != nil){
            
            let imageString = UserDefaults.standard.object(forKey: "pictureURLString") as! String
            
            profileImageView.sd_setImage(with: URL(string: imageString), completed: nil)
            
            profileImageView.layer.cornerRadius = 20.0
            
            let displayName = UserDefaults.standard.object(forKey: "displayName") as! String
            
            userNameLabel.text = displayName
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
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
