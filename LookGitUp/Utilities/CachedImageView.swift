//
//  CachedImageView.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/30/21.
//

import Foundation
import UIKit

class CachedImageView: UIImageView {

    let imageCache = NSCache<NSString, AnyObject>()

    public func setImage(url: URL,
                         completion: ((_ success: Bool) -> Void)?) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = cachedImage
            completion?(true)
        } else {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    completion?(false)
                    return
                }
                if let downloaded = UIImage(data: data) {
                    self?.imageCache.setObject(downloaded, forKey: url.absoluteString as NSString)
                    DispatchQueue.main.async {
                        self?.image = downloaded
                        completion?(true)
                    }
                } else {
                    completion?(false)
                }
                }.resume()
        }
    }

}
