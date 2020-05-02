//
//  NextViewController.swift
//  Swift5FirebaseAnonyumousLogin1
//
//  Created by 川端雄介 on 2020/05/01.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
