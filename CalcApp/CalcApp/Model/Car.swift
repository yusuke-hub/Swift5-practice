//
//  Car.swift
//  CalcApp
//
//  Created by 川端雄介 on 2020/04/03.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import Foundation

class Car{
    
    var frontwheel = 0
    var rearwheel = 0
    
    init(){
         
        frontwheel = 2
        rearwheel = 2
        
    }
    
    func drive(){
        print("運転開始 !!")
        print("前輪 \(frontwheel)")
        print("後輪 \(rearwheel)")
    }
    
    func move(toBack:String){
        
        print(toBack)
        
    }
    
    func plusAndMinus(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}
