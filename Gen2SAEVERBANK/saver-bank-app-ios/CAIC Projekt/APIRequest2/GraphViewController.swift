//
//  GraphViewController.swift
//  APIRequest2
//
//  Created by iYodjung on 28/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    
    let decoder = ImageConverter()
    
    var imagecode: CallPredict?
    
    
    @IBOutlet weak var graph: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var value: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    if let name = imagecode?.electric_predict {
                 
                 value.text = "The Forecasted Unit :  \(name.capitalized) Wh."
             }
    if let code = imagecode?.base64_graph {
            
        label1.text = "\(code.capitalized)"

        
        //Label Test
        let images: UIImage?    //Set Value "images" to UIImage
        images = base64ToImage(code)    //
    
        self.graph.image = images   //Show image
        }
    
    }
    
    //Convert the base64 to image Function
    func base64ToImage(_ base64String: String) -> UIImage? {
            guard let imageData = Data(base64Encoded: base64String) else { return nil }
            return UIImage(data: imageData)
        }
    

    
    
    
    
    /*
    extension GraphViewController: UIImageView {
        func load(url: URL) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.imagec = image
                        }
                    }
                }
            }
            
        }
        
    }
    
*/
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    
 
}
