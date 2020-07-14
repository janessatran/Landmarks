//
//  ContentView.swift
//  Landmarks
//
//  Created by Janessa Tran on 7/12/20.
//  Copyright © 2020 Janessa Tran. All rights reserved.
//

import SwiftUI

// Describes the view's content and layout
struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    var landmarkIndex: Int {
           userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
   }

    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                // to allow the map content to extend to the top edge of the screen
                .edgesIgnoringSafeArea(.top)
                // when you specify just the height, the width is auto to fill the content
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                Text(landmark.name)
                    // These methods are called modifiers
                    // Modifiers wrap a view to change its display or other properties
                    .font(.title)

                Button(action: {
                    self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                }) {
                    if self.userData.landmarks[self.landmarkIndex].isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color.gray)
                    }
                }
                }
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    // A spacer expands to make its containing view user all of the space of its parent view instead of having its sized defined only the contents
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)

                }
            }
            .padding()
            Spacer()
        }
    // This modifier gives the navigation bar a title when showing the detail view
            .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

// Declares a preview for the view
struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
        .environmentObject(UserData())

    }
}
