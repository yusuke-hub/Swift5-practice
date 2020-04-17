//
//  ViewController.swift
//  Swift5GoogleAdmob1
//
//  Created by 川端雄介 on 2020/04/17.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {


    @IBOutlet var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = "ca-app-pub-8994237886741626/7958489990"
        bannerView.rootViewController = self
        // 広告を呼び出す
        bannerView.load(GADRequest())
        
    }


}

