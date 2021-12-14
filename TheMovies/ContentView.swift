//
//  ContentView.swift
//  TheMovies
//
//  Created by Chukwuemeka Jennifer on 05/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showSettings = false
    var body: some View {
        NavigationView{
            Group {
                HomeTabView()
            }.navigationBarTitle("Movies", displayMode: .automatic)
                .navigationBarItems(trailing: HStack {
                    settingsButton
                })
                .sheet(isPresented: $showSettings, content: {
                    SettingsView(isPresented: $showSettings)
                    
                })
        }
        
    }
    private var settingsButton: some View{
        Button(action: {
            showSettings.toggle()
        }, label: {
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundColor(.gray)
            }.frame(width: 30, height: 40)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
