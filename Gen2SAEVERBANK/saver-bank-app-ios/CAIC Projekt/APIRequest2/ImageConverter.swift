//
//  ImageConverter.swift
//  APIRequest2
//
//  Created by iYodjung on 29/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//

import Foundation


/*
extension String {
    
  func base64Decoded() -> String {
    let decodedData = NSData(base64EncodedString: self, options:NSData.Base64DecodingOptions.fromRaw(0)!)
    let decodedString = NSString(data: decodedData, encoding: NSUTF8StringEncoding)
    return decodedString
  }
}
*/
 
 
class ImageConverter {
    
 
     
        /*    override func viewDidLoad() {
               super.viewDidLoad()
               // Do any additional setup after loading the view.
           
               let imageURL = URL(string: "https://scontent.fcnx2-1.fna.fbcdn.net/v/t1.0-9/80538164_2643412639080223_3966732142754398208_o.jpg?_nc_cat=109&_nc_sid=d4cf07&_nc_eui2=AeFNtK4vgUEfUXjZnf6F5voCedH7NKt5YIV50fs0q3lghT6z41j3kq6BkOztnY1Elh0Ui_TM5ciV1gk23bt899zp&_nc_ohc=xyK-vqxUPRwAX_NeFnH&_nc_ht=scontent.fcnx2-1.fna&oh=c8b8341b7a60214d2f34e8c90b54bf38&oe=5EF4AF78")!
               
               let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                   if error == nil {
                       let loadedImage = UIImage(data: data!)
                       
                       self.graph.image = convertBase64StringToImage(imageBase64String: ())
                   }
               }
               task.resume()
               
           }
    */
        
        /*
        
        func base64Convert(base64String: String?) -> UIImage{
          if (base64String?.isEmpty)! {
              return #imageLiteral(resourceName: "no_image_found")
          }else {
              // !!! Separation part is optional, depends on your Base64String !!!
              let temp = base64String?.components(separatedBy: ",")
              let dataDecoded : Data = Data(base64Encoded: temp![1], options: .ignoreUnknownCharacters)!
              let decodedimage = UIImage(data: dataDecoded)
              return decodedimage!
          }
        }
        
*/
    

}
