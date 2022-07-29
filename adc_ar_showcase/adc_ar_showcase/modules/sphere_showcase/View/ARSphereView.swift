//
//  ARSphereView.swift
//  adc_ar_showcase
//
//  Created by APPLAUDO on 29/7/22.
//

import SwiftUI
import RealityKit
import ARKit

struct ARSphereView: UIViewControllerRepresentable {
    typealias UIViewControllerType = ARViewController

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIViewController(context: Context) -> ARViewController {
        let viewController = ARViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {
    }

    class Coordinator: NSObject {
        var parent: ARSphereView
        init(_ parent: ARSphereView) {
            self.parent = parent
        }
    }
}


class ARViewController: UIViewController {
    let videoName = "cave_video"
    let videoType = "mp4"
    let spaceName = "SphereSpace.usdz"

    var playerLooper: AVPlayerLooper!

    override func viewDidAppear(_ animated: Bool) {
        let arView = ARView(frame: .zero)
        view = arView

        
        let anchor = AnchorEntity() // Anchor (anchor that fixes the AR model)
        anchor.position = simd_make_float3(0, 0, -3) // The position of the anchor is 3m away the initial position of the device.
        arView.scene.addAnchor(anchor)

        if let url = Bundle.main.url(forResource: videoName, withExtension: videoType) {
            let playerItem = AVPlayerItem(url: url)
            let player = AVQueuePlayer()
            playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)

            let material = VideoMaterial(avPlayer: player)
            do {
                let spaceModelEntity = try Entity.loadModel(named: spaceName)
                spaceModelEntity.model?.materials = [material]
                anchor.addChild(spaceModelEntity)
            } catch {
                assertionFailure("Could not load the USDZ asset.")
            }

            player.play()

        } else {
            assertionFailure("Could not load the video asset.")
        }

        let config = ARWorldTrackingConfiguration()
        arView.session.run(config)
    }
}
