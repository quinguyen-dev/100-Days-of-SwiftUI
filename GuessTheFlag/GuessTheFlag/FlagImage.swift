//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Qui Nguyen on 11/11/23.
//

import SwiftUI

struct FlagImage: View {
    @Environment(\.colorScheme) var colorScheme
    var image: String
    
    var body: some View {
        Image(image)
            .shadow(radius: 5)
            .border(colorScheme == .dark ? .white : .clear)
    }
}
