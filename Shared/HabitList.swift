import SwiftUI

struct HabitList: View {
    @Binding var habitList: [Habit]
    @State var isAddingNewHabit: Bool = true
    
    var body: some View {
        List {
            ForEach($habitList) { $habit in
                NavigationLink(destination:
                NavigationView {
                    Text("Hello World")
                }) {
                    HabitListItemView(habit: habit)
                }
            }
            Button(action: {
                isAddingNewHabit = true
            }) {
                HStack {
                    Image(systemName: "plus.circle")
                    Text("Add")
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Habits")
        .sheet(isPresented: $isAddingNewHabit) {
            Text("Hello world")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isAddingNewHabit = false
                        }
                    }
                }
        }
    }
}

struct HabitList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HabitList(
                habitList: .constant(HabitListPreviewData.previewData)
            )
        }
    }
}

struct HabitListPreviewData {
    static var previewData: [Habit] = [
        Habit(name: "Play guitar"),
        Habit(name: "Read")
    ]
}
