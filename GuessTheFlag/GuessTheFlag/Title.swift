//
//  Title.swift
//  GuessTheFlag
//
//  Created by Qui Nguyen on 11/11/23.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.largeTitle).foregroundStyle(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
