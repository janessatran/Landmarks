//
//  UserData.swift
//  Landmarks
//
//  Created by Janessa Tran on 7/14/20.
//  Copyright © 2020 Janessa Tran. All rights reserved.
//
// An observable object is a custom object for your data that can be bound to a view from storage in SwiftUI’s environment.
// SwiftUI watches for any changes to observable objects that could affect a view, and displays the correct version of the view after a change.
import Combine
import SwiftUI

// SwiftUI subscribes to your observable object, and updates any views that need refreshing when the data changes.

final class UserData: ObservableObject  {
    // An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
