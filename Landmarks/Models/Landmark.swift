//
//  Landmark.swift
//  Landmarks
//
//  Created by Janessa Tran on 7/13/20.
//  Copyright © 2020 Janessa Tran. All rights reserved.
//

import SwiftUI
import CoreLocation


// We make Landmark conform to Identifiable so we can pass the data in a SwiftUI List.
// Since the Landmark type already has the id property required, we don't need anything else.
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
