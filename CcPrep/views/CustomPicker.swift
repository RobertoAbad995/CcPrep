//
//  CustomPicker.swift
//  CcPrep
//
//  Created by Consultant on 9/14/22.
//

import SwiftUI

struct CustomPicker: View {
    
    @State var index : Int = 0
    @State private var filters : [String]
    @State var reachEnd : Bool = false
    private var lastIndex : Int = 0
    private var reachedToEnd : Bool = false

    init(options: [String]){
        self.filters = options
        lastIndex = filters.count
    }
    
    var body: some View {
        
        VStack {
           ScrollViewReader{ proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<lastIndex) { index in
                        Text(filters[index])
                            .padding()
                            .frame(height: 30)
                            .id(index)
                            .border(width: self.index == index ? 3 : 0, edges: [.bottom, .leading], color: Color("primary"))
                            .onTapGesture{
                                self.index = index
                            }
                            
                    }
                    .padding(.trailing, 10)
                }
            }
            .overlay(
                Button{
                    proxy.scrollTo((lastIndex - 1) ,anchor: nil)
                    reachEnd = true
                }
                label :{
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color("primary"))
                        .font(.headline)
                        .background(Color.white)
                    }
                    ,alignment: .trailing
                )
            }
            
        }
        .font(.headline)
        .background(Color.white)
        .foregroundColor(.black)
        
    }
    
}

struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPicker(options: [""])
    }
}
