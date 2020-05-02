//
//  Contents.swift
//  FirebaseAuth
//
//  Created by 川端雄介 on 2020/05/02.
//

import Foundation
class Contents{
    
    var userNameString:String = ""
    var profileImageString:String = ""
    var contentImageString:String = ""
    var commentString:String = ""
    var postDateString:String = ""
    
    init(userNameString:String,profileImageString:String,contentImageString:String,commentString:String,postDateString:String){
        
        self.userNameString = userNameString
        self.profileImageString = profileImageString
        self.contentImageString = contentImageString
        self.commentString = commentString
        self.postDateString = userNameString
    }
}
