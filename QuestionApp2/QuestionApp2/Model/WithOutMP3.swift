//
//  WithOutMP3.swift
//  QuestionApp2
//
//  Created by 川端雄介 on 2020/04/11.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import Foundation

class WithOutMP3: SoundFile{
    
    override func playSound(fileName: String, extensionName: String) {
        if extensionName == "mp3"{
            print("このファイルは再生できません")
        }
        player?.stop()
        
    }
}
