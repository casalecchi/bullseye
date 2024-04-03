//
//  ContentView.swift
//  Bullseye
//
//  Created by Felipe Casalecchi on 02/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
            Text("89")
            HStack {
                Text("1")
                Slider(value: .constant(50), in: 1.0...100.0)
                Text("100")
            }
            Button("Hit me") {
                
            }
        }
    }
}

#Preview {
    ContentView()
        .previewInterfaceOrientation(.landscapeRight)
}
