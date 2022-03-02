import SwiftUI

struct HabitList: View {
    @Binding var habitList: [Habit]
    @State var isAddingNewHabit: Bool = false
        
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
            NavigationView {
                NewHabitView(
                    onExitNewHabitView: {
                        isAddingNewHabit = false
                    },
                    onNewHabit: { newHabit in
                        habitList.append(newHabit)
                    }
                )
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
