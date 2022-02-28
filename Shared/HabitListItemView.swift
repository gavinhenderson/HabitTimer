import SwiftUI

struct HabitListItemView: View {
    var habit: Habit
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(habit.name)
        }
        .padding(.vertical)
    }
}

struct HabitListItemView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListItemView(habit: HabitListPreviewData.previewData[0])
            .previewLayout(.sizeThatFits)
    }
}
