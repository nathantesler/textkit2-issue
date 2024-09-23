//
//  SceneDelegate.swift
//  TextKitIssue
//
//  Created by Nathan Tesler on 20/9/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let rootViewController = EditorViewController(nibName: nil, bundle: nil)
        rootViewController.text = try! String(contentsOf: Bundle.main.url(forResource: "Example", withExtension: "txt")!, encoding: .utf8)
        window.rootViewController = rootViewController
        self.window = window
        window.makeKeyAndVisible()
    }
}

