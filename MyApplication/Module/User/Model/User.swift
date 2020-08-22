//
//  User.swift
//  MyApplication
//
//  Created by Shubham Garg on 29/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import Foundation

struct User:Codable {
    let email, first_name, last_name, avatar: String
    let id:Int
}

struct UserList:Codable {
    let page, per_page, total, total_pages:Int
    let data:Users
}


typealias Users = [User]
