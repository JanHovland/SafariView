//
//  ContentView.swift
//  SafariView
//
//  Created by Jan Hovland on 07/04/2020.
//  Copyright © 2020 Jan Hovland. All rights reserved.
//

import SwiftUI
import SafariServices

struct ContentView: View {
    // whether or not to show the Safari ViewController
    @State var showSafari = false
    // initial URL string
    @State var urlString = "https://duckduckgo.com"

    var body: some View {
        Button(action: {
            // update the URL if you'd like to
            self.urlString = "https://duckduckgo.com"
            // tell the app that we want to show the Safari VC
            self.showSafari = true
        }) {
            Text("Present Safari")
        }
        // summon the Safari sheet
        .sheet(isPresented: $showSafari) {
            SafariView(url:URL(string: self.urlString)!)
        }
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}
