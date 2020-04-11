//
//  ChangeColor.swift
//  QuestionApp2
//
//  Created by 川端雄介 on 2020/04/11.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import Foundation
import UIKit

class ChangeColor{
    
    func changeColor(topR:CGFloat, topG:CGFloat,topB:CGFloat,topAlpha:CGFloat,bottomR:CGFloat ,bottomG:CGFloat,bottomB:CGFloat,bottomAlpha:CGFloat)->CAGradientLayer{
        
        // グラデーションの最初の色を決める
        let topColor = UIColor(red: topR, green: topG, blue: topB, alpha: topAlpha)
        let bottomColor = UIColor(red: bottomR, green: bottomG, blue: bottomB, alpha: bottomAlpha)
        
        // グラデーションの色を配列で管理
        let gradientColor = [topColor.cgColor,bottomColor.cgColor]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        return gradientLayer
        
    }
}
