//
//  User.swift
//  APIRequest2
//
//  Created by iYodjung on 23/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//

import Foundation

struct User: Decodable {
    let email: String
    let first_name: String
    let last_name: String
    let message: String
    let status: String
    let token: String
    
/*  let id: Int
    let username: String
    let name: String
    let age: Int */
}

