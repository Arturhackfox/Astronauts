//
//  gridView.swift
//  Moonshot
//
//  Created by Arthur Sh on 27.11.2022.
//

import SwiftUI

struct gridView: View {
    let columns = [GridItem(.adaptive(minimum: 150))]
    let missions: [Missions] = Bundle.main.decoder("missions.json")
    let astronauts: [String: Astronaut]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
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
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay{
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.lightBackground)
                        }
                    }
                    
                }
            }
            .padding([.vertical,.horizontal])
            
        }
    }
}

struct gridView_Previews: PreviewProvider {
            static var astronaut: [String: Astronaut] = Bundle.main.decoder("astronauts.json")
    static var previews: some View {
        gridView(astronauts: astronaut)
    }
}
