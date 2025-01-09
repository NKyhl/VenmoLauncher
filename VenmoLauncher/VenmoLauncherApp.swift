//
//  VenmoLauncherApp.swift
//  VenmoLauncher
//
//  Created by Nolan Kyhl on 1/5/25.
//

import SwiftUI

@main
struct VenmoLauncherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
                .onContinueUserActivity("") { userActivity in
                    let url = URL(string: "venmo://paycharge?txn=pay")!
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
        }
    }
}
