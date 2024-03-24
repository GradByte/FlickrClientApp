//
//  NetworkManager.swift
//  Flickr Client App
//
//  Created by GradByte on 24.03.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    static let apiKey = "ENTER_YOUR_FLICKR_API_KEY"
    
    func fetchImage(withURLString url: String?, completion: @escaping (Data) -> Void) {
        if let urlString = url, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    debugPrint(error)
                    return
                }
                if let data = data {
                    DispatchQueue.main.async {
                        completion(data)
                    }
                }
            }.resume()
        }
    }
}
