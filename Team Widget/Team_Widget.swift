import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), team: TeamProvider.randomPersonOfTeam())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, team: TeamProvider.randomPersonOfTeam())
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, team: TeamProvider.randomPersonOfTeam())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let team: Team
}

struct Team_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        WidgetView(team: entry.team)
    }
}

struct Team_Widget: Widget {
    let kind: String = "Team_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Team_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Team_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Team_WidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), team: TeamProvider.randomPersonOfTeam()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
