//
//  PersonController.swift
//  DeckOf1Card
//
//  Created by Bobba Kadush on 5/13/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import Foundation

class PersonController {
    
    let baseURL = "https://swapi.co/api/"
    
    static let shared = PersonController()
    
    func fetchPersonWith(identifier: Int, completion: @escaping (Person?) -> Void){
        guard var url = URL(string: baseURL) else { completion(nil); return }
        
        url.appendPathComponent("people")
        url.appendPathComponent("\(identifier)")
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = data else {completion(nil); return}
             let decoder = JSONDecoder()
            do{
                let person = try decoder.decode(Person.self, from: data)
                completion(person)
                
            }catch{
                print(error.localizedDescription)
                completion(nil)
                return
            }
        }
        dataTask.resume()
    }
    
    
    
    
    
}
