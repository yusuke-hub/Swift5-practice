//
//  NextViewController.swift
//  Swift5FirebaseAnonyumousLogin1
//
//  Created by 川端雄介 on 2020/05/01.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import SDWebImage

class NextViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    

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
        
        // アイコン
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
        let contentImageView = cell.viewWithTag(4) as! UIImageView
        contentImageView.sd_setImage(with: URL(string: contentsArray[indexPath.row].profileImageString), completed: nil)
        
        // コメントラベル
        let commentLabel = cell.viewWithTag(5) as! UILabel
        commentLabel.text = contentsArray[indexPath.row].commentString
        
        return cell

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 603
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    @IBAction func cameraAction(_ sender: Any) {
        
        // アラート or アクションシート
        showAlert()
        
    }
    
    func doCamera(){
        
        let sourceType:UIImagePickerController.SourceType = .camera
        // カメラが利用可能どうかチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    func doAlbum(){
        
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        // アルバムが利用可能どうかチェック
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
    }
    
    // アラート
    func showAlert(){
        let alertController = UIAlertController(title: "選択", message: "どちらを使用しますか？", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "カメラ", style: .default) { (alert) in
            self.doCamera()
        }
        let action2 = UIAlertAction(title: "アルバム", style: .default) { (alert) in
            self.doAlbum()
        }
        let action3 = UIAlertAction(title: "キャンセル", style: .cancel)
            
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // 画像が選択 of 撮影後に呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectedImage = info[.originalImage] as! UIImage
        
        // ナビゲーションを用いて画面遷移
        let editPostVC = self.storyboard?.instantiateViewController(identifier: "editPost") as! EditAndPostViewController
        editPostVC.passedImage = selectedImage
        
        self.navigationController?.pushViewController(editPostVC, animated: true)
        
        // ピッカーを閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
