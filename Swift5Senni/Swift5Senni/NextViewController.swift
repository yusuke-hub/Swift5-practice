//
//  NextViewController.swift
//  Swift5Senni
//
//  Created by 川端雄介 on 2020/04/04.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet var label2: UILabel!
    
    var count2 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        label2.text = String(count2)
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
