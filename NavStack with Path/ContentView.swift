//
//  ContentView.swift
//  NavStack with Path
//
//  Created by Theo Vora on 6/20/23.
//

import SwiftUI

enum Route: Hashable {
    case card(i: Int)
    case results
    case settings
    case resendQuestion
}

struct CardView: View {
    var number: Int
    
    var body: some View {
        Text("\(number)")
            .font(.largeTitle).bold()
    }
}

struct ResultsView: View {
    var body: some View {
        VStack { // 8
            Text("96%")
                .font(.largeTitle.italic())
                .navigationTitle("Your Score")
        }
    }
}

struct SettingsView: View {
    var body: some View {
        List { // 9
            Text("Item 1")
            Text("Item 2")
        }
        .navigationTitle("Settings")
    }
}

struct ResendQuestionView: View {
    var body: some View {
        Button("Resend question") { // 10
            print("resending!")
        }
    }
}

struct RouteDetail: View {
    var route: Route // 6
    
    var body: some View {
        switch route { // 7
        case .card(let i):
            CardView(number: i)
        case .results:
            ResultsView()
        case .settings:
            SettingsView()
        case .resendQuestion:
            ResendQuestionView()
        }
    }
}

struct ContentView: View {
    @State private var path: [Route] = [.card(i: 12)] // 1

    var body: some View {
        NavigationStack(path: $path)  // 2
        { // 3
            VStack {
                Text("Insert any text here")
                    .font(.largeTitle)
            }
            .navigationDestination(for: Route.self) { route in  // 4
                RouteDetail(route: route) // 5
            }
            .navigationTitle("Bottom of the Stack")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
