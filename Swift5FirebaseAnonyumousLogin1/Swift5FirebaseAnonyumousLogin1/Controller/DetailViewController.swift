//
//  DetailViewController.swift
//  Swift5FirebaseAnonyumousLogin1
//
//  Created by 川端雄介 on 2020/05/12.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var userName = String()
    var contentImage = String()
    var date = String()
    var profileImage = String()
    var comment = String()

    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var contentsImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.layer.cornerRadius = 20.0
        profileImageView.sd_setImage(with: URL(string: profileImage), completed: nil)
        userNameLabel.text = userName
        dateLabel.text = date
        contentsImageView.sd_setImage(with: URL(string: contentImage), completed: nil)
        commentLabel.text = comment

    }
    
    @IBAction func shareAction(_ sender: Any) {
        
        let items = [contentsImageView.image] as Any
        let acView = UIActivityViewController(activityItems: items as! [Any], applicationActivities: nil)
        present(acView, animated: true, completion: nil)
    }
    
}
