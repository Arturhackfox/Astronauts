//
//  data - decoded.swift
//  Moonshot
//
//  Created by Arthur Sh on 24.11.2022.
//

import Foundation


extension Bundle {
    func decoder(_ file: String) -> [String: Astronaut] {
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Couldn't locate \(file)")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from \(file)")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
            fatalError("Failed to decode from \(file)")
        }
        return loaded
    }
}
