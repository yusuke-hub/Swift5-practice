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

class ViewController: UIViewController,CLLocationManagerDelegate,UIGestureRecognizerDelegate,SearchLocationDelegate {
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
        // ここでのsenderはlongPressTap / タップを開始した時の処理
        if sender.state == .began{
            
            
        }else if sender.state == .ended{
            // タップを終了した時の処理
            // タップした位置を指定して、MKMapView上の緯度、経度を取得する
            // 緯度経度から住所に変換する
            let tapPoint = sender.location(in: view)
            
            // タップした位置(CGPoint)を指定してMKMapView上の緯度,経度を取得する
            let center = mapView.convert(tapPoint, toCoordinateFrom: mapView)
            let lat = center.latitude
            let log = center.longitude
            convert(lat: lat, log: log)
        }
    }
    
    func convert(lat:CLLocationDegrees,log:CLLocationDegrees){
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: log)
        // クロージャー / placeMarkに住所が入る / administrativeArea:都道府県名 / locality:市区町村名
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if let placeMark = placeMark{
                if let pm = placeMark.first{
                    if pm.administrativeArea != nil || pm.locality != nil {
                        self.addressString = pm.name! + pm.administrativeArea! + pm.locality!
                    }else{
                        self.addressString = pm.name!
                    }
                    self.addressLabel.text = self.addressString
                }
            }
        }
    
    }

    @IBAction func goToSearchVC(_ sender: Any) {
        
        // 画面遷移
        performSegue(withIdentifier: "next", sender: nil?){

        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            if segue.identifier == "next"{
                let nextVC = segue.destination as! NextViewController
            }
        }
        func searchLocation(latValue: String, logValue: String) {
            if latValue.isEmpty != true && logValue.isEmpty != true {
                
                let latString = latValue
                let logString = logValue
                // 緯度,経度からコーディネート
                let coordinate = CLLocationCoordinate2DMake(Double(latString)!, Double(logString)!)
                // 表示する範囲を指定する
                let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                // 領域を指定する
                let region = MKCoordinateRegion(center:coordinate, span:span)
                // 領域をmapViewに設定
                mapView.setRegion(region, animated: true)
                // 緯度経度から住所へ変換
                convert(lat: Double(latString)!, log: Double(logString)!)
                // ラベルに表示
                addressLabel.text = addressString
            }else{
                addressLabel.text = "表示できません"
            }
        }

    }
}
