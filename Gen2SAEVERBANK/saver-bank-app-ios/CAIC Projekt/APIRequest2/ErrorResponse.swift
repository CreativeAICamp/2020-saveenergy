//
//  ErrorResponse.swift
//  APIRequest2
//
//  Created by iYodjung on 23/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//

import Foundation

struct ErrorResponse: Decodable, LocalizedError {
    let message: String
    let status: String
    
    // let reason: String
    
    var errorDescription: String? { return message }
}
