//
//  MainAppViewController.swift
//  APIRequest2
//
//  Created by iYodjung on 23/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//


import UIKit

class MainAppViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = user?.name {
            
            label.text = "Welcome, \(name.capitalized)"
        }
    }
}
