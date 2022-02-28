import SwiftUI

@main
struct HabitTimerApp: App {
    @State var habitList: [Habit] = HabitListPreviewData.previewData
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HabitList(habitList: $habitList)
            }
        }
    }
}
