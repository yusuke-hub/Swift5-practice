//
//  NextViewController.swift
//  Swift5Button
//
//  Created by 川端雄介 on 2020/03/26.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var count = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tap(_ sender: Any) {
        
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
