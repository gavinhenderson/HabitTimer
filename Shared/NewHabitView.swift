import SwiftUI

struct NewHabitView: View {
    @State var newHabitName: String = ""
    
    var onExitNewHabitView: () -> Void
    var onNewHabit: (Habit) -> Void
    
    var body: some View {
        Form {
            Section(header: Text("Name of yor new habit")) {
                TextField("ie. Learn Piano", text: $newHabitName)
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    onExitNewHabitView()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Add Habit") {
                    let newHabit = Habit(name: newHabitName)
                    newHabitName = ""
                    
                    onNewHabit(newHabit)
                    onExitNewHabitView()
                }
            }
        }
        .navigationTitle("New habit details")
    }
}

struct NewHabitView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitView(onExitNewHabitView: {}, onNewHabit: {_ in })
    }
}
