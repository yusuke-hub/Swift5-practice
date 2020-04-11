//
//  imagesModel.swift
//  QuestionApp2
//
//  Created by 川端雄介 on 2020/04/11.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import Foundation

class ImagesModel{
    // 画像名を取得して、その画像名が人間かそうでないかをフラグによって判定するための機能
    let imageText:String
    let answer:Bool
    
    init(imageName:String,correctOrNot:Bool){
        imageText = imageName
        answer = correctOrNot
    }
}
