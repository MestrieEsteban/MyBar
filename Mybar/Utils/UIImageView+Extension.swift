//
//  UIImageView+Extension.swift
//  Mybar
//
//  Created by Alexis Piraux on 08/04/2021.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
func fetchImage(from url: URL?) {
    guard let url = url else { return }
    let key = NSString(string: url.absoluteString)
    if let image = imageCache.object(forKey: key) {
        self.image = image
        return
    }
    
    let session = URLSession.shared

    let dataTask = session.dataTask(with: url) { (data, response, error) in
        if error != nil {
            print("Error fetching the image! 😢")
            DispatchQueue.main.async {
                self.image = nil
            }
        } else if let data = data, let image = UIImage(data: data) {
            DispatchQueue.main.async {
                self.image = image
                imageCache.setObject(image, forKey: key)
            }
        }
    }
        
    dataTask.resume()
}
}
