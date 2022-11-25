//
//  Missionview.swift
//  Moonshot
//
//  Created by Arthur Sh on 25.11.2022.
//

import SwiftUI

struct Missionview: View {
    struct crewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    var mission: Missions
    let crew: [crewMember]
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.6)
                        .padding(.vertical)
                    
                    VStack(alignment: .leading){
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission highlights: ")
                            .padding(.bottom, 7)
                            .font(.title.bold())
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew")
                            .padding(.bottom, 7)
                            .font(.title.bold())
                    }
                    .padding(.horizontal)
                    
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
            }
            .padding(.bottom)
            .background(.darkBackground)
            

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

struct Missionview_Previews: PreviewProvider {
    static let missions: [Missions] = Bundle.main.decoder("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decoder("astronauts.json")
    static var previews: some View {
        Missionview(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
