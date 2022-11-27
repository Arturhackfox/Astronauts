//
//  astronautsPhotosScrollview.swift
//  Moonshot
//
//  Created by Arthur Sh on 27.11.2022.
//

import SwiftUI

struct astronautsPhotosScrollview: View {
    
    let mission: Missions
    let crew: [crewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(crew, id: \.role){ crewMember in
                    NavigationLink{
                        AstronautDetailView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack{
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                }
                            VStack(alignment: .leading){
                                Text(crewMember.astronaut.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        
                    }
                    
                }
                }
            }
            .padding(.horizontal)
        }

    }
    init(mission: Missions, astronauts: [String: Astronaut]){
        self.mission = mission
        self.crew = mission.crew.map {member in
            if let astronaut = astronauts[member.name]{
                return crewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name )")
            }
        }
    }
}

struct astronautsPhotosScrollview_Previews: PreviewProvider {
    static let missions: [Missions] = Bundle.main.decoder("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decoder("astronauts.json")
    static var previews: some View {
        astronautsPhotosScrollview(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
