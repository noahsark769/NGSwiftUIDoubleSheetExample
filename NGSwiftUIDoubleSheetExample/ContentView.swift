//
//  ContentView.swift
//  NGSwiftUIDoubleSheetExample
//
//  Created by Noah Gilmore on 12/22/20.
//

import SwiftUI

struct ContentView: View {
    @State var isPresenting1 = false
    @State var isPresenting2 = false

    var body: some View {
        VStack {
            Button("Present Sheet 1") {
                self.isPresenting1 = true
            }
            Button("Present Sheet 2") {
                self.isPresenting2 = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: self.$isPresenting1, content: {
            Button("Dismiss") {
                self.isPresenting1 = false
            }
            .frame(width: 200, height: 200).background(Color.red)
        })
        .sheet(isPresented: self.$isPresenting2, content: {
            Button("Dismiss") {
                self.isPresenting2 = false
            }
            .frame(width: 200, height: 200).background(Color.red)
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
