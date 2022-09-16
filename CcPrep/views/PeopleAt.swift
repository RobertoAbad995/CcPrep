//
//  PeopleAt.swift
//  CcPrep
//
//  Created by Consultant on 9/14/22.
//
import MapKit
import SwiftUI

struct PeopleAt: View {
    
//    @EnvironmentObject var vm : DemoViewModel
    @ObservedObject var vm : DemoViewModel = DemoViewModel()
    @Environment(\.presentationMode) var mode
    var title: String
    
    var body: some View {
        NavigationView {
            
                
                VStack (spacing: 1) {
                    HStack{
                        Button(
                            action:{
                            mode.wrappedValue.dismiss()
                            },label: {
                                
                                Image(systemName: "arrow.left")
                                Text("People at \(title)")
                                    .font(.headline)
                            })
                        .padding([.bottom, .leading], 5)
                        
                        
                        Spacer()
                        
                        Text("Overview")
                            .font(.headline)
                            .padding([.bottom, .trailing], 5)
                    }
                    .background(Color.pink)
                    .frame(width: .infinity, height: 50)
                    
                    //change the map for an image
                   Image("pub")
                        .resizable()
                        .frame(width: .infinity, height: 350)

                    
                    CustomList(typeList: .people, items: vm.users)
                }//END STACKVIEW
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .background(Color("primary"))
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
