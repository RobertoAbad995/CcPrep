//
//  DemoViewModel.swift
//  CcPrep
//
//  Created by Consultant on 9/14/22.
//
import MapKit
import Foundation

enum MapDefaults{
    static let startingLocation = CLLocationCoordinate2D(latitude: 33.884611, longitude: -84.469765)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
}

class DemoViewModel : NSObject, ObservableObject, CLLocationManagerDelegate {

    @Published var region = MKCoordinateRegion(center: MapDefaults.startingLocation, span: MapDefaults.defaultSpan)
    @Published var selection : String = "Days"
    var users : [String] = [
        "Random name 1",
        "Random name 2",
        "Random name 3",
        "Random name 4",
        "Random name 5",
        "Random name 6",
        "Random name 7",
        "Random name 8",
        "Random name 9",
        "Random name 10"
    ]
   
    let filterOptions : [String] = [
        "Days",
        "Cafes",
        "Bars",
        "Pubs",
        "Staduims",
        "Malls",
//        "Popular",
//        "Recomendation",
        "Closer to you"
    ]
}
