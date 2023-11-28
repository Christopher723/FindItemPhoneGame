//
//  viewModel.swift
//  FindItemPhone
//
//  Created by Christopher Woods on 11/18/23.
//

import Foundation
import SwiftUI
import GameKit

class MyViewModel: ObservableObject {
    @Published var images = ["bananna","strawberry","cherry","blueberry","grape","kiwi","lemon","orange","watermelon"]
    @Published var special = ""
    
    init() {
            special = images.remove(at: Int.random(in: 0..<images.count))
        }
    func reset(){
        images = ["bananna","strawberry","cherry","blueberry","grape","kiwi","lemon","orange","watermelon"]
        special = images.remove(at: Int.random(in: 0..<images.count))
    }
    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { vc, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
        }
    }
}

//class GameViewModel{
//    func authenticateUser() {
//        GKLocalPlayer.local.authenticateHandler = { vc, error in
//            guard error == nil else {
//                print(error?.localizedDescription ?? "")
//                return
//            }
//        }
//    }
//    
//    func loadLeaderboard() async {
//        
//        Task{
//            let leaderboards = try await GKLeaderboard.loadLeaderboards(IDs: ["FruitBoard"])
//            
//        }
//    }
//    
//    func leaderboard(elapsedTime: Double) async{
//        Task{
//            try await GKLeaderboard.submitScore(
//                Int(elapsedTime * 1000),
//                context: 0,
//                player: GKLocalPlayer.local,
//                leaderboardIDs: ["FruitBoard"]
//            )
//        }
//    }
//}
//public struct GameCenterView: UIViewControllerRepresentable {
//    let viewController: GKGameCenterViewController
//    
//    public init(leaderboardID : String?) {
//        
//        if leaderboardID != nil {
//            self.viewController = GKGameCenterViewController(leaderboardID: leaderboardID!, playerScope: GKLeaderboard.PlayerScope.global, timeScope: GKLeaderboard.TimeScope.allTime)
//        }
//        else{
//            self.viewController = GKGameCenterViewController(state: GKGameCenterViewControllerState.leaderboards)
//        }
//        
//    }
//    
//    public func makeUIViewController(context: Context) -> GKGameCenterViewController {
//        let gkVC = viewController
//        gkVC.gameCenterDelegate = context.coordinator
//        return gkVC
//    }
//    
//    public func updateUIViewController(_ uiViewController: GKGameCenterViewController, context: Context) {
//        return
//    }
//    
//    public func makeCoordinator() -> GKCoordinator {
//        return GKCoordinator(self)
//    }
//}
//
//public class GKCoordinator: NSObject, GKGameCenterControllerDelegate {
//    var view: GameCenterView
//    
//    init(_ gkView: GameCenterView) {
//        self.view = gkView
//    }
//    
//    public func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
//        gameCenterViewController.dismiss(animated: true, completion: nil)
//    }
//}
