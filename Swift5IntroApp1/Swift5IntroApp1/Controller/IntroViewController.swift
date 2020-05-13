//
//  IntroViewController.swift
//  Swift5IntroApp1
//
//  Created by 川端雄介 on 2020/05/13.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import Lottie

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    
    // jsonファイルを入れる配列を準備
    var onboardArray = ["1","2","3","4","5"]
    var onboardStringArray = ["私たちはみんな繋がっています", "あいうえお","かきくけこ","さしすせそ","たちつてと"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1,2,3と止まる。ページングができるようになる
        scrollView.isPagingEnabled = true
        setUpScroll()

        for i in 0...4{
            
            let animationView = AnimationView()
            let animation = Animation.named(onboardArray[i])
            // 間違い↓
            // x: view.frame.size.width
            // アニメーションが全て2番目のscrollViewに表示されていた
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
        }
    }
    
    func setUpScroll(){
        scrollView.delegate = self
        // 5ページ分の画面を表示できるようにする
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollView.frame.size.height)
        
        for i in 0...4{
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: view.frame.size.height / 3, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabel.textAlignment = .center
            onboardLabel.text = onboardStringArray[i]
            scrollView.addSubview(onboardLabel)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
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
