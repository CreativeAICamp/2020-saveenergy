//
//  Test1.swift
//  APIRequest2
//
//  Created by iYodjung on 29/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//

import UIKit


class TestController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = .white
        
        let catImage = UIImage(named: "cat.jpg")
        
        let myImageView:UIImageView = UIImageView()
        myImageView.contentMode = UIView.ContentMode.scaleAspectFit
        myImageView.frame.size.width = 200
        myImageView.frame.size.height = 200
        myImageView.center = self.view.center
        
        myImageView.image = catImage
 
        view.addSubview(myImageView)
        
        //Get data of existing UIImage
        let imageData = catImage?.jpegData(compressionQuality: 1)
 
        // Convert image Data to base64 encodded string
        let imageBase64String = imageData?.base64EncodedString()
        print(imageBase64String ?? "Could not encode image to Base64")
 
         let newImageData = Data(base64Encoded: imageBase64String!)
         if let newImageData = newImageData {
            myImageView.image = UIImage(data: newImageData)
         }
 
        self.view = view
    }
}

