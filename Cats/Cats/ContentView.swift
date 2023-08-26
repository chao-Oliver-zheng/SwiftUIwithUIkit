//
//  ContentView.swift
//  Cats
//
//  Created by Oliver Zheng on 8/21/23.
//

import SwiftUI
import Combine
struct ContentView: View {
    
    @StateObject var viewModel = CatServiceViewModel()
    var body: some View {
        VStack{
            
            Button(action: {
                viewModel.getData()
                print("clicked")
                
            }) {
                Text("Fetch data")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(.blue)
                    .cornerRadius(15)
            }
            
            if  !viewModel.data.isEmpty  {
                ScrollView{
                    CatViewControllerWrapper(info: viewModel.data)
                }
            } else{
                Text("nil val")
            }
            
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
