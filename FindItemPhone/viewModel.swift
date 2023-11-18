//
//  viewModel.swift
//  FindItemPhone
//
//  Created by Christopher Woods on 11/18/23.
//

import Foundation
import SwiftUI


class MyViewModel: ObservableObject {
    @Published var images = ["bananna","strawberry","cherry","blueberry","grape","kiwi","lemon","orange","watermelon"]
    @Published var special = ""
    
    init() {
            special = images.remove(at: Int.random(in: 0..<images.count))
        }
}
