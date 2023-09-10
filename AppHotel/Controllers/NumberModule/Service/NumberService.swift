//
//  NumberService.swift
//  AppHotel
//
//  Created by Ravil on 10.09.2023.
//

import Foundation

class NumberService {
    static func fetchNumbers(completion: @escaping ([Room]?, Error?) -> Void) {
        let apiUrl = "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
        
        guard let url = URL(string: apiUrl) else {
            print("Invalid URL")
            completion(nil, NSError(domain: "InvalidURL", code: -1, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching number data: \(error)")
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
                let numberResponse = try decoder.decode(NumberResponse.self, from: data)
                let numbers = numberResponse.rooms
                completion(numbers, nil)
            } catch {
                print("Error parsing JSON: \(error)")
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
