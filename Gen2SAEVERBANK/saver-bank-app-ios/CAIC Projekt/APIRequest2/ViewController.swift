//
//  ViewController.swift
//  APIRequest2
//
//  Created by iYodjung on 23/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

     override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
        
        @IBOutlet weak var usernameTextField: UITextField!
        @IBOutlet weak var passwordTextField: UITextField!
        
        let alertService = AlertService()
        let networkingService = NetworkingService()
        

        
        @IBAction func didTapLoginButton() {
            
            guard
                let username = usernameTextField.text,
                let password = passwordTextField.text
                else { return }
            
    //        formDataRequest(username: username, password: password)
            
            jsonRequest(username: username, password: password)
        }
        
        func formDataRequest(username: String, password: String) {
            let parameters = ["username": username,
                              "password": password]
            
            networkingService.request(endpoint: "/login/", parameters: parameters) { [weak self] (result) in
                
                switch result {
                    
                case .success(let user): self?.performSegue(withIdentifier: "loginSegue", sender: user)

                case.failure(let error):
                    
                    guard let alert = self?.alertService.alert(message: error.localizedDescription) else { return }
                    self?.present(alert, animated: true)
                }
            }
        }
        
        func jsonRequest(username:String, password: String) {
            
            let login = Login(username: username, password: password)
            
            networkingService.request(endpoint: "/login/", loginObject: login) { [weak self] (result) in
                
                switch result {
                    
                case .success(let user): self?.performSegue(withIdentifier: "loginSegue", sender: user)
                    
                case.failure(let error):
                    
                    guard let alert = self?.alertService.alert(message: error.localizedDescription) else { return }
                    self?.present(alert, animated: true)
                }
            }
        }
        
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if let mainAppVC = segue.destination as? MainAppViewController, let user = sender as? User {
                
                mainAppVC.user = user
            }
        }
  
    }
