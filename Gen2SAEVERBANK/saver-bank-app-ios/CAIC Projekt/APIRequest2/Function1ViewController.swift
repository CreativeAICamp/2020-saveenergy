//
//  Function1ViewController.swift
//  APIRequest2
//
//  Created by iYodjung on 27/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//

import UIKit

class Function1ViewController: UIViewController {
    
    
    @IBOutlet weak var storeidTextField: UITextField!
    @IBOutlet weak var yearTextfield: UITextField!
    @IBOutlet weak var monthsTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    let alertService = AlertService()
    let networkingService = NetworkingService()
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func didTapSubmitButton() {
        guard
            let store_id = storeidTextField.text,
            let years = yearTextfield.text,
            let months = monthsTextField.text,
            let date = dateTextField.text
            
        else { return }
        
        jsonRequest(store_id: store_id, years: years, months: months, date: date)
    }
    
    func formDataRequest(store_id: String, years: String, months: String, date: String) {
    
        let parameters = ["storeid": store_id,
                          "years": years,
                          "months": months,
                          "date": date]
        
        networkingService.request_1(endpoint: "/feature_1/", parameters: parameters) { [weak self] (result) in
            switch result {
                
            case .success(let user): self?.performSegue(withIdentifier: "functionSegue", sender: user)

            case.failure(let error):
                
                guard let alert = self?.alertService.alert(message: error.localizedDescription) else { return }
                self?.present(alert, animated: true)
            }
        }
    }
        
    
    
    func jsonRequest(store_id:String, years: String, months: String, date: String) {
        
        let power = Function1(store_id: store_id, years: years, months: months, date: date)
        
        networkingService.request_1_1(endpoint: ("/feature_1/"), funcObject: power ) { [weak self] (result) in
            
            switch result{
                case .success(let imagecode): self?.performSegue(withIdentifier: "functionSegue", sender: imagecode)
                                   
                case.failure(let error):
                    guard let alert = self?.alertService.alert(message: error.localizedDescription) else { return }
                        self?.present(alert, animated: true)
                }
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               
               if let graphVC = segue.destination as? GraphViewController, let user = sender as? CallPredict {
                   
                graphVC.imagecode = user
               }
        
        

           }
    
    override func viewDidLoad() {
        //Rounded Button
                 submitButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
                 submitButton.layer.cornerRadius = 25.0
                 submitButton.tintColor = UIColor.white
           
    }
   
}

