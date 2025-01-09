//
//  VenmoLauncherControlWidget.swift
//  VenmoLauncher
//
//  Created by Nolan Kyhl on 1/8/25.
//

import WidgetKit
import SwiftUI
import AppIntents

@available(iOS 18.0, *)
struct VenmoLauncherControlWidget: ControlWidget {
    let kind: String = "VenmoLauncherControlWidget"
    
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: kind) {
            ControlWidgetButton(action: LaunchVenmo()) {
                Label("Launch Venmo", systemImage: "custom.icon-symbol")
            }
        }
    }
}

@available(iOS 18.0, *)
@available(iOSApplicationExtension 18.0, *)
struct LaunchVenmo: AppIntent {
    static var title: LocalizedStringResource = "Launch Venmo"
    static var description = IntentDescription("Quickly pay someone using Venmo.")
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult & OpensIntent {
        
        let url = URL(string: "venmo://paycharge?txn=pay")!
        
        return .result(opensIntent: OpenURLIntent(url))
    }
}
