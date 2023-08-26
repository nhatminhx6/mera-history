//
//  ContentView.swift
//  MeraHistory
//
//  Created by NhatMinh on 24/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DynastyList()    // 1
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("DynastyList")
                            
                        }
            UserListView().tabItem {
                Image(systemName: "house.fill")
                Text("UserList")
            }
        }
        
        
    }
}




//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
