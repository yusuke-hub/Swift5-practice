//
//  NextViewController.swift
//  Swift5FirebaseAnonyumousLogin1
//
//  Created by 川端雄介 on 2020/05/01.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import SDWebImage

class NextViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet var timeLineTabelView: UITableView!
    
    @IBOutlet var cameraButton: UIButton!
    
    var selectedImage = UIImage()
    
    var userName = String()
    var userImageData = Data()
    var userImage = UIImage()
    var commentString = String()
    var createDate = String()
    var contentImageString = String()
    var userProfileImageString = String()
    
    // Contentsクラスの配列を代入する
    var contentsArray = [Contents]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLineTabelView.delegate = self
        timeLineTabelView.dataSource = self
        // このif文を書いているのは、userNameがnilだった場合、アプリケーションが落ちてしまうから
        if UserDefaults.standard.object(forKey: "userName") != nil{
            
            userName = UserDefaults.standard.object(forKey: "userName") as! String
        }
        if UserDefaults.standard.object(forKey: "userImage") != nil{
            
            userImageData = UserDefaults.standard.object(forKey: "userImage") as! Data
            userImage = UIImage(data: userImageData)!
        }
        
        

    }
    // UITableViewに表示したいセルの数を教える
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contentsArray.count
    }
    // セルを生成して返却するメソッドで、セルの数だけ呼びだされる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = timeLineTabelView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // コンテンツ
        
        // 配列は0からだが、Tagは1から始める
        // profileImageView
        let profileImageView = cell.viewWithTag(1) as! UIImageView
        
        profileImageView.sd_setImage(with: URL(string: contentsArray[indexPath.row].profileImageString), completed: nil)
        profileImageView.layer.cornerRadius = 30.0
        
        // ユーザー名
        let userNameLabel = cell.viewWithTag(2) as! UILabel
        userNameLabel.text = contentsArray[indexPath.row].userNameString
        
        // 投稿日時
        let dateLabel = cell.viewWithTag(3) as! UILabel
        dateLabel.text = contentsArray[indexPath.row].postDateString
        
        // 投稿画像

        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
