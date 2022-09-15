//
//  Test.swift
//  CcPrep
//
//  Created by Consultant on 9/14/22.
//

import SwiftUI

struct CustomList: View {
    
    
    @State var typeList: TypeList = .places
    @State var title : String = "Today"
    @State var items : [String] = []
    var date : String = Date().description
    
    var body: some View {
        
        List{
            Section(
                header:
                    Text(typeList == .people ? date : "Today")
                    .font(.system(size: 10, weight: .semibold))
            ){
                ForEach(items, id: \.self) { item in
                    
                    ZStack(alignment: .leading){
                        
                        if typeList == .places{
                            NavigationLink(
                                destination: PeopleAt(title: item),
                                label: {})
                            .opacity(0.0)
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        HStack() {
                            
                            if typeList == .people {
                                
                                Image("userTest")
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                                    .overlay(Circle().stroke(Color("primary")))
                            }else{
                                Circle()
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                                    .overlay(Circle().stroke(Color("primary")))
                                    .frame(width: 40, height: 40, alignment: .leading)
                                    
                            }
                            VStack{
                                Text(item.capitalized)
                                      .font(.headline)
                                Text(item)
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                            if typeList == .people{
                                Image("rowIcon")
                            }
                        }
                    }//END ZSTACK
                    
                }
              }
        }
        .listStyle(GroupedListStyle())
//        .listStyle(PlainListStyle())
        .onAppear(perform: {
            UITableView.appearance().contentInset.top = -20
        })
        .background(Color.white)
        .foregroundColor(.black)
        
    }
    
    enum TypeList{
        case people
        case places
    }
}

struct CustomList_Previews: PreviewProvider {
    static var previews: some View {
        CustomList()
    }
}
