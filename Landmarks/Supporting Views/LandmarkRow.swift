//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Janessa Tran on 7/13/20.
//  Copyright © 2020 Janessa Tran. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

// The code you write in the preview provider only changes what Xcode displays in the canvas.
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        // You can use a Group to return multiple previews from a preview provider. They will get rendered as separate views in the canvas.
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70)) // this modifier sets a size that approximates a row in the list for the preview

    }
}
