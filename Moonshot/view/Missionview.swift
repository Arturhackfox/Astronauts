//
//  Missionview.swift
//  Moonshot
//
//  Created by Arthur Sh on 25.11.2022.
//

import SwiftUI

struct Missionview: View {
    
    var mission: Missions
    var astronauts: [String: Astronaut]
  
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.6)
                        .padding(.vertical)
                    
                    Text(mission.formattedBadgeDate)
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading){
                        
                     rectangleDivider()
                        
                        Text("Mission highlights: ")
                            .padding(.bottom, 7)
                            .font(.title.bold())
                        Text(mission.description)
                        
                        rectangleDivider()
                        
                        Text("Crew")
                            .padding(.bottom, 7)
                            .font(.title.bold())
                    }
                    .padding(.horizontal)
                    
                    astronautsPhotosScrollview(mission: mission, astronauts: astronauts)
                    
                }
            }
            .padding(.bottom)
            .background(.darkBackground)
            
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
