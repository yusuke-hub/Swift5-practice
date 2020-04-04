//
//  ViewController.swift
//  Swift5Senni
//
//  Created by 川端雄介 on 2020/04/04.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var label: UILabel!
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func plus(_ sender: Any) {
        count = count + 1
        
        label.text = String(count)
        
        if count == 10{
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
        nextVC.count2 = count
    }
}

