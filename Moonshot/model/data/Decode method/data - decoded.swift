//
//  data - decoded.swift
//  Moonshot
//
//  Created by Arthur Sh on 24.11.2022.
//

import Foundation


extension Bundle {
    func decoder<T: Codable>(_ file: String) -> T {
        
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Couldn't locate \(file)")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from \(file)")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        
        // Any date that goes anywhere will be formatted like this:
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode from \(file)")
        }
        return loaded
    }
}
