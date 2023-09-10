//
//  BookService.swift
//  AppHotel
//
//  Created by Ravil on 10.09.2023.
//

import Foundation

class BookService {
    static func fetchBooking(completion: @escaping (Book?, Error?) -> Void) {
        let apiUrl = "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8"
        
        guard let url = URL(string: apiUrl) else {
            print("Invalid URL")
            completion(nil, NSError(domain: "InvalidURL", code: -1, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching hotel data: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil, NSError(domain: "NoData", code: -1, userInfo: nil))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let hotelData = try decoder.decode(Book.self, from: data)
                completion(hotelData, nil)
            } catch {
                print("Error parsing JSON: \(error)")
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
