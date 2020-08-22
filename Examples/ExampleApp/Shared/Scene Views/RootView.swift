//
//  RootView.swift
//  Shared
//
//  Created by CypherPoet on 8/19/20.
//

import SwiftUI


struct RootView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SynchronousActionExample()) {
                    Text("Synchronous Action")
                }
                NavigationLink(destination: AsyncSideEffectExample()) {
                    Text("Async Side Effects")
                }
            }
            .navigationTitle(Text("Redux Data Flow"))
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
