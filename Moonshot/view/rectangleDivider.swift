//
//  rectangleDivider.swift
//  Moonshot
//
//  Created by Arthur Sh on 27.11.2022.
//

import SwiftUI

struct rectangleDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct rectangleDivider_Previews: PreviewProvider {
    static var previews: some View {
        rectangleDivider()
    }
}
