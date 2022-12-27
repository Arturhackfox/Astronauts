//
//  darkBackgroundView.swift
//  Moonshot
//
//  Created by Arthur Sh on 27.11.2022.
//

import SwiftUI

struct darkBackgroundView: View {
    var body: some View {
        Color.darkBackground
            .ignoresSafeArea()
    }
}

struct darkBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        darkBackgroundView()
    }
}
