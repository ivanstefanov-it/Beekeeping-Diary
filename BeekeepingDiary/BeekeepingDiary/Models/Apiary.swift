import SwiftData
import Foundation

@Model
class Apiary: Identifiable {
    var id = UUID()
    var name: String
    var city: String
    var registrationNumber: String
    
    @Relationship(deleteRule: .cascade)
    var hives: [Hive]
    @Relationship(deleteRule: .cascade)
    var tasks: [BeekeepingTask] = []
    
    init(
        name: String,
        city: String,
        registrationNumber: String,
        hives: [Hive]
    ) {
        self.name = name
        self.city = city
        self.registrationNumber = registrationNumber
        self.hives = hives
    }
}
