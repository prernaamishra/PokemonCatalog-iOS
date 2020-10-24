//
//  NetworkImageView.swift
//  PokemonCatalog
//
//  Created by Prerna Mishra on 10/20/20.
//  Copyright © 2020 Prerna Mishra. All rights reserved.
//

import UIKit

class NetworkImageView: UIImageView {
    
    private let activityloader = UIActivityIndicatorView()
    
    func showLoader() {
        image = nil
        activityloader.center = center
        activityloader.frame = bounds
        activityloader.style = .large
        addSubview(activityloader)
        activityloader.startAnimating()
    }
    
    func stopLoader() {
        activityloader.removeFromSuperview()
    }
    
    func loadImage(url: URL) {
        image = nil
        var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: TimeInterval(20.0))
        request.httpMethod = HTTPMethod.get.rawValue
        
        WebService.shared.callRestAPI(with: request) { [weak self] result in
            
            switch result {
            case .failure(let error):
                debugPrint(error.localizedDescription)
            case .success(let data):
                if let image = UIImage(data: data) {
                    self?.setImage(image: image)
                }
            }
            
        }
    }
    
    func setImage(image: UIImage) {
        DispatchQueue.main.async {
            self.stopLoader()
            self.image = image
            self.alpha = 0.3
            UIView.animate(withDuration: 1, animations: {
                self.alpha = 1
            })
        }
    }
    
}

