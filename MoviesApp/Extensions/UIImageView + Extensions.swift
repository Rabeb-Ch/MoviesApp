//
//  UIImageView+Extensions.swift
//  MoviesApp
//
//  Created by Rabeb Chelbi on 2/7/2022.
//

import UIKit

let imageCache = NSCache< NSString, UIImage>()

extension UIImageView {
    /// Allow to download image asyncronously, store downloaded image into cache and download new image if image in cache not availabel
    func downloadImage(fromURLString urlString : String) {
        guard let url = URL(string: ApiUrls.imageBaseUrl.rawValue + urlString) else {
            return
        }
        self.image = nil
        
        /// Retrieve image from cache if available, if not download new image
        if let imageFromCache = imageCache.object(forKey: NSString(string: urlString)) {
            self.image = imageFromCache
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                return
            }
            
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                
                let imageToCache = UIImage(data: data)
                /// Store downloaded image data into cache
                imageCache.setObject(imageToCache ?? UIImage(systemName: "x.square.fill")!, forKey: NSString(string: urlString))
                
                self.image = imageToCache
            }
        }
        task.resume()
    }
}
