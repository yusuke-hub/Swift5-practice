//
//  NextViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by 川端雄介 on 2020/04/06.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
protocol SearchLocationDelegate {
    func searchLocation(latValue:String, logValue:String)
}

class NextViewController: UIViewController {

    @IBOutlet var latTextField: UITextField!
    @IBOutlet var logTextField: UITextField!
    var delegate:SearchLocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func okAction(_ sender: Any) {
        // 入力された値を取得
        let latValue = latTextField.text!
        let logValue = logTextField.text!
        

        // 両方のTFが空でなければ戻る
        if latTextField.text != nil || logTextField.text != nil{
            // デリゲートメソッドの引数に入れる
            delegate?.searchLocation(latValue: latValue, logValue: logValue)
            dismiss(animated: true, completion: nil)
        }
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
