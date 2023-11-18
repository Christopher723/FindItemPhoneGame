//
//  ItemView.swift
//  FindItemPhone
//
//  Created by Christopher Woods on 11/17/23.
//

import SwiftUI


struct ItemView: View {
    @EnvironmentObject var myImage: MyViewModel
    @Binding var isFinished: Bool

    // Generate a random special image position once
    var specialImagePosition: (row: Int, column: Int)
       

    var body: some View {
        VStack {
            ForEach(0..<10) { rowIndex in
                HStack {
                    ForEach(0..<10) { columnIndex in
                        let isSpecialImageCell = rowIndex == specialImagePosition.row && columnIndex == specialImagePosition.column

                        
                        if isSpecialImageCell {
                            
                            Image("\(myImage.special)") // Use the name of your special image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .onTapGesture{
                                    isFinished = true
                                }
                                
                        } else {
                            
                            Image("\(myImage.images.randomElement()!)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                
                                
                                
                        }
                    }
                }
            }
        }.onAppear(){
            print(myImage.special)
        }
    }
}

