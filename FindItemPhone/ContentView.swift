//
//  ContentView.swift
//  FindItemPhone
//
//  Created by Christopher Woods on 11/16/23.
//

import SwiftUI


struct ContentView: View {
    @State private var dragLocation: CGPoint = .zero
    @State var isMoving = false
    @StateObject var myImage = MyViewModel()
    @State private var elapsedTime: Double = 0.0
    @State private var timer: Timer?
    @State private var startTime: Date?
    @State var isFinished = false
    
    private let specialImagePosition: (row: Int, column: Int) = {
            (row: Int.random(in: 0..<10), column: Int.random(in: 0..<10))
        }()

    var body: some View {
        ZStack {
            Color.black
                .overlay(
                    ItemView(isFinished: $isFinished, specialImagePosition: specialImagePosition).environmentObject(myImage)
                        .mask(
                            GeometryReader { geometry in
                                Circle()
                                    .frame(width: 100, height: 100) // Adjust the circle size as needed
                                    .position(self.dragLocation)
                                    .blendMode(.overlay)
                            }
                        )
                )
                .gesture(DragGesture()
                    .onChanged { value in
                        self.dragLocation = value.location
                            .applying(.init(translationX: -45, y: -275)) // Adjust based on the frame size of the image
                        isMoving = true
                    }
                    .onEnded{_ in
                        isMoving = false
                    }
                )

            VStack {
                Spacer().frame(height: 100)
                HStack {
                    Text("Find:")
                        .font(.title)
                        .foregroundColor(.white)

                    Image(myImage.special)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding(.bottom, 10)

                    Spacer()

                    // Display time with milliseconds
                    Text("Time: \(formattedTime)")
                        .font(Font.system(.title, design: .monospaced))
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                }
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            startTimer()
        }
        .onChange(of: isFinished) {
            stopTimer()
        }
    }

    var formattedTime: String {
        let milliseconds = Int(elapsedTime * 1000) % 1000
        let seconds = Int(elapsedTime) % 60
        let minutes = Int(elapsedTime) / 60
        return String(format: "%02d:%02d.%03d", minutes, seconds, milliseconds)
    }

    func startTimer() {
        startTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if let startTime = startTime {
                elapsedTime = Date().timeIntervalSince(startTime)
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}


#Preview {
    ContentView()
}
