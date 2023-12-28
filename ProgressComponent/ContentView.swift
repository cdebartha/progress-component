//
//  ContentView.swift
//  ProgressComponent
//
//  Created by Debartha Chakraborty on 29/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress = 0.0
    
    var body: some View {
        VStack {
            ProgressionView(percent: progress)
                .frame(width: 300, height: 30)
            
            Button {
                if progress > 0.9 {
                    progress = 0
                } else {
                withAnimation(.spring(response: 1)) {
                        progress += 0.1
                    }
                }
            } label: {
                Text("Animate")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
