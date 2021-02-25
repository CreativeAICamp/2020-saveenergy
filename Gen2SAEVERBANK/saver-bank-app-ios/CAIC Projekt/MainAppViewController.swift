//
//  MainAppViewController.swift
//  APIRequest2
//
//  Created by iYodjung on 27/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//

import UIKit

class MainAppViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var predictButton: UIButton!
    @IBOutlet weak var monitorButton: UIButton!
    @IBOutlet weak var requestsButton: UIButton!

    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Rounded Button
        predictButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        predictButton.layer.cornerRadius = 25.0
        predictButton.tintColor = UIColor.white
        
        monitorButton.backgroundColor = UIColor.init(red: 48/255, green: 99/255, blue: 173/255, alpha: 1)
              monitorButton.layer.cornerRadius = 25.0
              monitorButton.tintColor = UIColor.white
        
        requestsButton.backgroundColor = UIColor.init(red: 173/255, green: 43/255, blue: 99/255, alpha: 1)
              requestsButton.layer.cornerRadius = 25.0
              requestsButton.tintColor = UIColor.white
        
        //Label with Username
        if let name = user?.first_name {
            
            label.text = "Welcome, \(name.capitalized)"
        }
    }
}

