//
//  ContentView.swift
//  Moonshot
//
//  Created by Arthur Sh on 24.11.2022.
//

import SwiftUI

struct ContentView: View {
    let decodedData = Bundle.main.decoder("astronauts.json")
    var body: some View {
        VStack{
            Text("\(decodedData.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
