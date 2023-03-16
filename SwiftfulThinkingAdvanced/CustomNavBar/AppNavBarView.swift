//
//  AppNavBarView.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Frédéric Helfer on 14/03/23.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink {
                    Text("aaa")
                        .customNavigationTitle("Second Screen")
                        .customNavigationSubtitle("Subtitle should be showing!!")
                } label: {
                    Text("Navigate")
                }
            }
            .customNavBarItems(title: "New Title", subtitle: nil, backButtonHidden: true)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
    
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigate")
                }
                
                
            }
            .navigationTitle("Nav title here")
        }
    }
}
