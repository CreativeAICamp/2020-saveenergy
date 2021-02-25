//
//  AlertService.swift
//  APIRequest2
//
//  Created by iYodjung on 23/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//

import Foundation

import UIKit

class AlertService {
    
    func alert(message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }
}
