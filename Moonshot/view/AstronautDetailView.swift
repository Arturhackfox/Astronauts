//
//  AstronautDetailView.swift
//  Moonshot
//
//  Created by Arthur Sh on 25.11.2022.
//

//MARK: Challenge to redo this app 

import SwiftUI

struct AstronautDetailView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
}

struct AstronautDetailView_Previews: PreviewProvider {
    static var astronauts: [String: Astronaut] = Bundle.main.decoder("astronauts.json")
    static var previews: some View {
        AstronautDetailView(astronaut: astronauts["armstrong"]!)
    }
}
