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
    
    var count = 0
    
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
    
    // 検索キーワードの値を元に画像を引っ張ってくる
    // pixabay.com
    
    func getImages(keyword:String){
        
        // API Key
        let url = "https://pixabay.com/api/?key=16064611-59760cae7c854f0163b3ff527&q=\(keyword)"
        
        // Alamofire(ネットワーク通信の記述をシンプリ化する為のライブラリ)を使ってhttpリクエストを投げる
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result{
                
            case .success:

//                self.indicator.stopAnimating()
                
                let json:JSON = JSON(response.data as Any)
                var imageString = json["hits"][self.count]["webformatURL"].string
                if imageString == nil{
                        
                    imageString = json["hits"][0]["webformatURL"].string
                    self.odaiImageView.sd_setImage(with: URL(string: imageString!), completed: nil)
                        
                        
                }else{
                        
                    self.odaiImageView.sd_setImage(with: URL(string: imageString!), completed: nil)

                }
                    
                    
                    
             case .failure(let error):
                    
                     print(error)
                    
                    
             }
                
         }
        // 返ってきた値にJSON解析を行う
        
        // imageView.imageに貼り付ける
        
    }

    @IBAction func nextOdai(_ sender: Any) {
        
        count = count + 1
        
        if searchTextField.text == ""{
            
            getImages(keyword: "funny")
            
        }else{
            
            getImages(keyword: searchTextField.text!)
        }
        
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
        self.count = 0
        if searchTextField.text == ""{
                
                getImages(keyword: "funny")
                
        }else{
                
            getImages(keyword: searchTextField.text!)
        }
            
    }
    @IBAction func next(_ sender: Any) {
        
        performSegue(withIdentifier: "next", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let shareVC = segue.destination as? ShareViewController
        shareVC?.commentString = commentTextView.text
        shareVC?.resultImage = odaiImageView.image!
    }
}

