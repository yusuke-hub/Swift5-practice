//
//  ViewController.swift
//  Swift5Bokete1
//
//  Created by 川端雄介 on 2020/04/15.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import Photos

class ViewController: UIViewController {
 
    @IBOutlet var odaiImageView: UIImageView!
    
    @IBOutlet var commentTextView: UITextView!
    
    @IBOutlet var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTextView.layer.cornerRadius = 20.0
        
        // フォトライブラリへのアクセス許可を設定する
        PHPhotoLibrary.requestAuthorization{ (status) in
            
            switch(status){
            case .authorized: break
            case .denied: break
            case .notDetermined: break
            case .restricted: break
         }
     }
        // Do any additional setup after loading the view.
    }
    
    // 検索キーワードの値を序と日画像を引っ張ってくる
    // pixabay.com
    
    func getImages(keyword:String){
        
        // API Key
        let url = "https://pixabay.com/api/?key=16064611-59760cae7c854f0163b3ff527&q=\(keyword)"
        
        // Alamofireを使ってhttpリクエストを投げる
        
        // 返ってきた値にJSON解析を行う
        
        // imageView.imageに貼り付ける
        
    }


}

