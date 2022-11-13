//
//  APIManager.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import Foundation
import UIKit

class APIManager {

    func getPhotosFrom(url: String, completionHandler: @escaping ([PhotoModel]) -> Void) {
        
        guard let photoURL = URL(string: url) else {
            print("Invalid URL")
            return
        }
                
        URLSession.shared.dataTask(with: URLRequest(url: photoURL)) { data, response, error in
            
            guard let data = data, error == nil else {
                print("Could not get data from URL")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([PhotoModel].self, from: data)
                completionHandler(decodedData)
            } catch {
                print("There was a problem decoding the JSON data")
            }
            
        }.resume()
    }
    
    
    func getImageFrom(url: String, completionHandler: @escaping (UIImage) -> Void) {
        
        guard let imageURL = URL(string: url) else {
            print("Invalid URL")
            return
        }
                
        URLSession.shared.dataTask(with: URLRequest(url: imageURL)) { data, response, error in
            
            guard let data = data, error == nil else {
                print("Could not get data from URL")
                return
            }
            

            if let image = UIImage(data: data) {
                completionHandler(image)
            } else {
                print("Could not turn data into image")
            }
            
        }.resume()
    }

}
