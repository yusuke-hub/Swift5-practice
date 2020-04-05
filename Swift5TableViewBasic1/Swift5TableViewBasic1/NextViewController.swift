//
//  NextViewController.swift
//  Swift5TableViewBasic1
//
//  Created by 川端雄介 on 2020/04/05.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var toDoString = String()

    @IBOutlet var todoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoLabel.text = toDoString
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
