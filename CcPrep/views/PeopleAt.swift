//
//  PeopleAt.swift
//  CcPrep
//
//  Created by Consultant on 9/14/22.
//
import MapKit
import SwiftUI

struct PeopleAt: View {
    
    @EnvironmentObject var vm : DemoViewModel
    @Environment(\.presentationMode) var mode
    var title: String
    
    var body: some View {
        NavigationView {
                
                VStack (spacing: 0) {
                    
                    Map(coordinateRegion: $vm.region)
                        .frame(height: 350)
                        .accentColor(Color.pink)
                    CustomList(typeList: .people, items: vm.users)
                }//END STACKVIEW
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                
                    Button(
                        action:{
                        mode.wrappedValue.dismiss()
                        },label: {
                            
                            Image(systemName: "arrow.left")
                            Text("People at \(title)")
                                .font(.headline)
                        })
                
                ,trailing:
                    Text("Overview")
                    .font(.headline)
            )
            .background(Color.pink)
            .foregroundColor(.white)
            
            
            
            
        }//END NAVIGATION VIEW
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}

struct PeopleAt_Previews: PreviewProvider {
    static var previews: some View {
        PeopleAt(title: "...")
    }
}
