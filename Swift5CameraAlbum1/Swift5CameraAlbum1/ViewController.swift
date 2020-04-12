//
//  ViewController.swift
//  Swift5CameraAlbum1
//
//  Created by 川端雄介 on 2020/04/12.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var backImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PHPhotoLibrary.requestAuthorization{(status) in
            
            switch(status){
            case .authorized:
                print("許可されています")

            case .denied:
                print("拒否されました")

            case .notDetermined:
                print("notDetermined")

            case .restricted:
                print("restricted")
            }
    }


    @IBAction func openCamera(_ sender: Any) {
        
        let sourceType = UIImagePickerController.SourceType.camera
        // カメラが利用可能かどうかチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            // 変数化
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
            present(cameraPicker, animated: true, completion: nil)
                
        }else{
                print("エラー")
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func openAlbum(_ sender: Any) {
        let sourceType = UIImagePickerController.SourceType.photoLibrary
        // カメラが利用可能かどうかチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            // 変数化
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
            present(cameraPicker, animated: true, completion: nil)
                
         }else{
                print("エラー")
         }
                
    }
}


    


