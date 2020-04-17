//
//  TableViewController.swift
//  Swift5GoogleAdmob1
//
//  Created by 川端雄介 on 2020/04/17.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import GoogleMobileAds

class TableViewController: UITableViewController,GADBannerViewDelegate,GADInterstitialDelegate {
    
    var profileImageArray = ["0","1","2","3","4"]
    var textArray = ["顔文字0","顔文字1","顔文字2","顔文字3","インタースティシャル広告"]
    
    var interstitial:GADInterstitial!
    
    let backImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "backGroundImage")
        backImageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        backImageView.image = image
        tableView.backgroundView = backImageView

        interstitial = createAndLoadInterstitial()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // bannerViewのセルの分を1足している
        return 1 + textArray.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let indexNumber = indexPath.row
        
        if indexPath.row == 0{
            
            // インタースティシャル広告だけならば
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath)
            let bannerView = cell.viewWithTag(1)  as! GADBannerView
            bannerView.adUnitID = "ca-app-pub-8994237886741626/8780864496"
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            
            return cell
            
        }else{
            
            // セルがあるならば
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            // tagを1としたUIImageViewにテキストを表示する
            let profileImageView = cell2.viewWithTag(1) as! UIImageView
            // バナー用のセル１つ分をちゃんと引く
            profileImageView.image = UIImage(named: profileImageArray[indexPath.row - 1])
            // tagを2としたUILabelにテキストを表示する
            let nameLabel = cell2.viewWithTag(2) as! UILabel
            nameLabel.textColor = .white
            nameLabel.font = .boldSystemFont(ofSize: 20)
            nameLabel.numberOfLines = 3
            nameLabel.text = textArray[indexNumber - 1]
            
            return cell2
        }
    }
    // セルがタップされた時に呼ばれる処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 5{
            if interstitial.isReady{
                
                interstitial.present(fromRootViewController: self)
            }else{
                
                print("まだ広告の準備ができません")
            }
            
        }
    }
    
    func createAndLoadInterstitial() -> GADInterstitial{
        
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-8994237886741626/1201509952")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        
        return interstitial
    }
    // ×ボタンを押して、インタースティシャル広告を閉じた時、別の広告を準備する
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        
        interstitial = createAndLoadInterstitial()
    }
}
