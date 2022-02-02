//
//  UIImageView+.swift
//  MarvelApp
//
//  Created by İbrahim DOGAN on 1.02.2022.
//  Copyright © 2022 Asit Aslan. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImage(from URLString: String) {
        guard let url = URL(string: URLString+".jpg") else {
            self.image = UIImage()
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    self.image = UIImage()
                }
                return
            }
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  httpURLResponse.statusCode == 200,
                  let data = data else {
                      DispatchQueue.main.async {
                          self.image = UIImage()
                      }
                      return
                  }
    
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
