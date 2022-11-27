//
//  listView.swift
//  Moonshot
//
//  Created by Arthur Sh on 27.11.2022.
//

import SwiftUI

struct listView: View {
//    let missions: [Missions] = Bundle.main.decoder("missions.json")
//    let astronaut: [String: Astronaut] = Bundle.main.decoder("astronauts.json")
    
     let missions: [Missions] = Bundle.main.decoder("missions.json")
    var astronauts: [String: Astronaut]
    
    var body: some View {
        
        List{
            ForEach(missions) { mission in
            NavigationLink{
                Missionview(mission: mission, astronauts: astronauts)
            } label: {
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    VStack{
                        Text(mission.displayName)
                            .foregroundColor(.white)
                        
                        Text(mission.formattedDate)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.lightBackground)
                    
                }
                .background(.darkBackground)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.lightBackground)
                }
                
            }}
            .listRowBackground(darkBackgroundView())

        }
        .scrollContentBackground(.hidden)
        .listRowBackground(Color.red)
        .background(.darkBackground)
        .padding([.vertical,.horizontal])
        
        
    }
    
    
}

struct listView_Previews: PreviewProvider {
    
    static let astronauts: [String: Astronaut] = Bundle.main.decoder("astronauts.json")
    static var previews: some View {
        listView( astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
