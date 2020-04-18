//
//  ChatViewController.swift
//  ChatApp1
//
//  Created by 川端雄介 on 2020/04/18.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var messageTextField: UITextField!
    
    // スクリーンサイズ
    let screenSize = UIScreen.main.bounds.size
    
    var chatArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        messageTextField.delegate = self
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
        // セルの高さを可変にする
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.estimatedRowHeight = 75
        
        // テキストフィールドと送信ボタンとセットでキーボードを出したり、閉じたりする
        // NotificationCenterは司令塔
        // (_ :)は引数が取れるという意味
        // #selectorはobjective-cの名残
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillHide(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Firebaseからデータを取得(fetch)する

    }
    
    // 引数としてNSNotification型を取れるという意味
    @objc func keyboardWillShow(_ notification:NSNotification){
        
        // CG(CoreGraphics)
        let keyboardHeight = ((notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as Any) as AnyObject).cgRectValue.height
        
        // 画面全体の高さからキーボードと入力分の高さを引く
        messageTextField.frame.origin.y = screenSize.height - keyboardHeight - messageTextField.frame.height
        
        
    }
    
    @objc func keyboardWillHide(_ notification:NSNotification){
        
        messageTextField.frame.origin.y = screenSize.height - messageTextField.frame.height
        
        guard let rect = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {return}
        
        UIView.animate(withDuration: duration){
            
            let transform = CGAffineTransform(translationX: 0, y: 0)
            self.view.transform = transform
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        messageTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        messageTextField.resignFirstResponder()
        return true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // メッセージの数
        return
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
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
