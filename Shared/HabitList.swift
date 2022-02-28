import SwiftUI

struct HabitList: View {
    @Binding var habitList: [Habit]
    @State var isAddingNewHabit: Bool = false
    @State var newHabitName: String = ""
    
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
                Form {
                    Section(header: Text("Name of yor new habit")) {
                        TextField("ie. Learn Piano", text: $newHabitName)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isAddingNewHabit = false
                            newHabitName = ""
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add Habit") {
                            isAddingNewHabit = false
                            let newHabit = Habit(name: newHabitName)
                            newHabitName = ""
                            habitList.append(newHabit)
                        }
                    }
                }
                .navigationTitle("New habit details")
            }
        }
    }
}

struct HabitList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HabitList(
                habitList: .constant(HabitListPreviewData.previewData),
                isAddingNewHabit: true
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
