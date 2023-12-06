//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Mark Nair on 12/4/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        //1. Find the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in the bundle.")
        }
        
        //2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from the bundle.")
        }
        
        //3. Create a decoder.
        let decoder = JSONDecoder()
        
        //4. Create a property for the decoder.
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from the bundle.")
        }
        
        
        //5. Return the data.
        return loaded
    }
}
