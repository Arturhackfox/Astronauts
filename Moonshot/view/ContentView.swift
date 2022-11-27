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
    
    
    @State private var showingList = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.darkBackground
                if showingList{
                   listView(astronauts: astronauts)

                } else {
                    gridView(astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                Button(showingList ? "Show Grid" : "Show List") {
                    showingList.toggle()
                }
            }
           
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
