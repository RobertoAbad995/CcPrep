//
//  ContentView.swift
//  CcPrep
//
//  Created by Consultant on 9/14/22.
//
import MapKit
import SwiftUI

struct MainView: View {
    
    @ObservedObject var vm: DemoViewModel = DemoViewModel()
    
    var body: some View {
       
        
        NavigationView {
                
                VStack (spacing: 0) {
                    
                    Map(coordinateRegion: $vm.region)
                        .frame(height: 350)
                        .accentColor(Color.pink)
                    
                    CustomPicker(options: vm.filterOptions)
                   
                    CustomList(items: vm.users)
                    
                }//END STACKVIEW

            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    HStack{
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color.white)
                            .font(.headline)
                        
                        Text("Who's out?")
                        .font(.headline)
                    }
                    
                ,trailing:
                             HStack {
                Image(systemName: "plus.circle")
                Image(systemName: "magnifyingglass")
            })
            .background(Color.pink)
            .foregroundColor(.white)
            
            
        }//END NAVIGATION VIEW
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
    }
}
