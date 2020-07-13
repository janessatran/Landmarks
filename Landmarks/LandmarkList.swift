//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Janessa Tran on 7/13/20.
//  Copyright © 2020 Janessa Tran. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // To add nav abilities, we embed the list in a NavigationView and nest each row in a NavigationLink
        NavigationView {
            // Using SwiftUI's List type will display a platform-specific list of views.
            // Lists work with identifiable data
            // Data is made identifiable in 2 ways:
            // 1. Passing along with data a key path to a unique ID for each element
            // 2. Making the data conform to Identifiable protocol.
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            .navigationBarTitle(Text("Landmarks"))
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // you can provide the name of any device as it appears in Xcode's scheme menu
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in LandmarkList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName) // show device names under preview
        }
    }
}
