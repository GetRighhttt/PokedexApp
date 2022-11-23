//
//  Helpers.swift
//  PokedexApp
//
//  Created by Stefan Bayne on 11/23/22.
//

/**
 Place for Helper functions
 */
import Foundation

/**
 Making an extension allows us to generically call these methods on any file we want.
 This maximizes the reusability of the code.
 */
extension Bundle {
    
    /**
     Method to decode data.
     */
    func decode<T:Decodable>(file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("File \(file) not found in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Not able to decode \(file).")
        }
        
        return loadedData
    }
    
    /**
     Method to fetch Data from api using completion handlers.
     */
    func fetchData<T: Decodable>(url: String, model: T.Type,
                                 completion: @escaping(T) ->(),
                                 failure: @escaping(Error) -> ()) {
        
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }.resume()
    }
}
