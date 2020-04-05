//
//  ViewController.swift
//  ProtocoBasicApp1
//
//  Created by 川端雄介 on 2020/04/05.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CatchProtocol {
    
    
    @IBOutlet var label: UILabel!
    
    var count = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func catchData(count: Int) {
        
        label.text = String(count)
    }
    @IBAction func next(_ sender: Any) {
        // 次の画面に飛ぶ時の処理を記述
        performSegue(withIdentifier: "next", sender: nil)
    }
    // 値を渡す時の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
        nextVC.delegate = self
    }
}

