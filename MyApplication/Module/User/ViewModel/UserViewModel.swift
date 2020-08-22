//
//  UserViewModel.swift
//  MyApplication
//
//  Created by Shubham Garg on 29/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import Foundation

class UserViewModel {
    let userEmail, userName, mobileNo : String
    var userImageUrl: URL?
    
    init(user: User) {
        self.userName = user.first_name + " " + user.last_name
        self.userEmail = user.email
        self.mobileNo = "1234567890"
        if let url = URL(string: user.avatar){
            self.userImageUrl = url
        }
    }
    
    func isValid(email:String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValid(mobileNumber:String) -> Bool{
        let PHONE_REGEX = "^\\d{3}\\d{3}\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return phoneTest.evaluate(with: mobileNumber)
    }
}
