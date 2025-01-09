//
//  VenmoLauncherWidget.swift
//  VenmoLauncherWidget
//
//  Created by Nolan Kyhl on 1/5/25.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let timeline = Timeline(entries: [SimpleEntry(date: Date())], policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct VenmoLauncherWidgetEntryView : View {
    var entry: SimpleEntry

    var body: some View {
        VStack {
            Link(destination: URL(string: "venmo://paycharge?txn=pay")!) {
                ZStack {
                    Circle()
                        .fill(Color.black)
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
            }
        }
        .widgetBackground(Color.clear)
    }
}

struct VenmoLauncherWidget: Widget {
    let kind: String = "VenmoLauncherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            VenmoLauncherWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Venmo Launcher")
        .description("Quickly pay someone using Venmo.")
        .supportedFamilies([.accessoryCircular])
    }
}

struct VenmoLauncherWidget_Previews: PreviewProvider {
    static var previews: some View {
        VenmoLauncherWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}

extension View {
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}
