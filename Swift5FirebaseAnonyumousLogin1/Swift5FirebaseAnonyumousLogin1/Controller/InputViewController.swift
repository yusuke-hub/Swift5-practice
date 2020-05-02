//
//  InputViewController.swift
//  Swift5FirebaseAnonyumousLogin1
//
//  Created by 川端雄介 on 2020/05/01.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class InputViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

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
    // タッチ開始時
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userNameTextField.resignFirstResponder()
    }
    
    @IBAction func imageViewTap(_ sender: Any) {
        
        // iPhone6s以降に搭載された、Taptic Engineというハードウェアによる振動で、ユーザーのアクションに対するフィードバックを表現する
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        // アラートを出す
        // カメラかアルバムを選択させる
    }
    
    // カメラ立ち上げメソッド
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
    // ユーザーが画像、動画を選択した時の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if info[.originalImage] as? UIImage != nil{
            let selectedImage = info[.originalImage] as! UIImage
            UserDefaults.standard.set(selectedImage.jpegData(compressionQuality: 0.1), forKey: "userImage")
            
            logoImageView.image = selectedImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
    // ユーザーが画像、動画の選択をキャンセルした時の処理
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil )
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
    

}
