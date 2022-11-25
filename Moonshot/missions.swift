//
//  missions.swift
//  Moonshot
//
//  Created by Arthur Sh on 24.11.2022.
//

import Foundation

struct Missions: Codable, Identifiable {
    struct Crew: Codable {
        let name: String
        let role: String
    }
    
            let id: Int
            let launchDate: Date?
            let crew: [Crew]
            let description: String
    
    
    var displayName: String{
        
        "Apollo \(id)"
        
    }
    var image: String {
        "apollo\(id)"
    }
    
    var formattedDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
 
   
    
}


