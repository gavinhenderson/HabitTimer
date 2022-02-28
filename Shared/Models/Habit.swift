import Foundation

// A single habit
struct Habit: Identifiable {
    var name: String
    var id: UUID
    
    init(
        name: String = "Unnamed habit"
    ) {
        self.name = name
        self.id = UUID()
    }
}
