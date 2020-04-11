//
//  Human.swift
//  QuestionApp2
//
//  Created by 川端雄介 on 2020/04/11.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import Foundation

class Human:Animal{
    
    override func breath() {
        super.breath()
        profile()
    }
    func profile(){
        
        print("私はYusuke Kawabataです")
    }
    
}
