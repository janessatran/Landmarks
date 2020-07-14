//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Janessa Tran on 7/13/20.
//  Copyright © 2020 Janessa Tran. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    // State is a value, or a set of values, that can change over time, and that affects a view’s behavior, content, or layout.
    // You use a property with the @State attribute to add state to a view.
    //    @State var showFavoritesOnly = false
    @EnvironmentObject var userData: UserData

    var body: some View {
        // To add nav abilities, we embed the list in a NavigationView and nest each row in a NavigationLink
        NavigationView {
            // Using SwiftUI's List type will display a platform-specific list of views.
            // Lists work with identifiable data
            // Data is made identifiable in 2 ways:
            // 1. Passing along with data a key path to a unique ID for each element
            // 2. Making the data conform to Identifiable protocol.
            List {
                // you can access a binding to a member of the userData object by using the $ prefix
                // A binding controls the storage for a value, so you can pass data around to different views that need to read or write it.

                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                .navigationBarTitle(Text("Landmarks"))
            }
        }
    }

    struct LandmarkList_Previews: PreviewProvider {
        static var previews: some View {
            // you can provide the name of any device as it appears in Xcode's scheme menu
            ForEach(["iPhone XS Max"], id: \.self) { deviceName in LandmarkList()
                .environmentObject(UserData())
            }
        }
    }
}
