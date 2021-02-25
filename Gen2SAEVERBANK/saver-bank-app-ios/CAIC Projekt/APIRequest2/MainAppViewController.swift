//
//  MainAppViewController.swift
//  APIRequest2
//
//  Created by iYodjung on 23/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//

import UIKit

class MainAppViewController: UIViewController {
    
    let alertService = AlertService()
    let networkingService = NetworkingService()
          
    @IBOutlet weak var storeTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var motnhTextField: UITextField!

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var label: UILabel!
    
     var user: User?
     
     override func viewDidLoad() {
         super.viewDidLoad()

         if let name = user?.first_name {
             
             label.text = "Welcome, \(name.capitalized)"
         }
     }
    
        

 
}
