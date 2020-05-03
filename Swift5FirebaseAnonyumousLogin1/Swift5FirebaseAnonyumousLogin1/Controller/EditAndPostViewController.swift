//
//  EditAndPostViewController.swift
//  Swift5FirebaseAnonyumousLogin1
//
//  Created by 川端雄介 on 2020/05/02.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import Firebase

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
    
    
    @IBAction func postAction(_ sender: Any) {
        
        // DBのchildを決める
        // childByAutoId:データのリストに追加する.一位の識別子として使用できる一意のキーが生成される
        let timeLineDB = Database.database().reference().child("timeLine").childByAutoId()
        
        // StorageサーバーのURLを取得する
        let storage = Storage.storage().reference(forURL: "")
        
        let key = timeLineDB.child("Users").childByAutoId().key
        let key2 = timeLineDB.child("ProfileImage   ").childByAutoId().key
        
        let imageRef = storage.child("Users").child("\(String(describing: key!)).jpg")
        let imageRef2 = storage.child("Contents").child("\(String(describing: key2!)).jpg")
        
        var userProfileImageData:Data = Data()
        var contentImageData:Data = Data()
        
        if userProfileImageView.image != nil{
            userProfileImageData = (userProfileImageView.image?.jpegData(compressionQuality: 0.01))!
        }
        if contentImageView.image != nil{
            contentImageData = (contentImageView.image?.jpegData(compressionQuality: 0.01))!
        }

        let uploadTask = imageRef.putData(userProfileImageData, metadata: nil) { (metaData, error) in
            
            if error != nil{
                print(error)
                return
            }
            
            let uploadTask2 = imageRef.putData(contentImageData, metadata: nil) { (metaData, error) in
                <#code#>
            }
            
            if error != nil{
                print(error)
                return
            }
            
            imageRef.downloadURL { (url, error) in
                if url != nil{
                    imageRef2.downloadURL { (url2, error) in
                        if url2 != nil{
                            
                            // キーバリュー型で送信するものを準備する
                            // URL型を文字列型に変換する為にabsoluteString
                            let timeLineInfo = ["userName":self.userName as Any,"userProfileImage":url?.absoluteString as Any,"contents":url2?.absoluteString as Any,"comment":self.commentTextField.text as Any,"postDate":ServerValue.timestamp()] as [String:Any]
                            // データを送信
                            timeLineDB.updateChildValues(timeLineInfo)
                            
                            // popViewController:navigationControllerで遷移した時に前の画面に戻る処理
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                }
            }
        }
        
        uploadTask.resume()
        self.dismiss(animated: true, completion: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
