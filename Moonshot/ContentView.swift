//
//  ContentView.swift
//  Moonshot
//
//  Created by Arthur Sh on 24.11.2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decoder("astronauts.json")
    let missions: [Missions] = Bundle.main.decoder("missions.json")
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStack{
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
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
