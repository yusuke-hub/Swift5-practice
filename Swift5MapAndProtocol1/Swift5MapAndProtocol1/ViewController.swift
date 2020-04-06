//
//  ViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by 川端雄介 on 2020/04/06.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate,UIGestureRecognizerDelegate {
    
    var addressString = ""
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    @IBOutlet var settingButton: UIButton!
    @IBOutlet var mapView: MKMapView!
    var locManager:CLLocationManager!
    @IBOutlet var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingButton.backgroundColor = .white
        // 角丸にする
        settingButton.layer.cornerRadius = 20.0
    }

    @IBAction func longPressTap(_ sender: UILongPressGestureRecognizer) {
        // ここでのsenderはlongPressTap
        if sender.state == .began{
            
        }else if sender.state == .ended{
            
        }
    }
    
}

