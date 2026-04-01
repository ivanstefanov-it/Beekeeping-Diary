import SwiftData
import Foundation

@Model
class Apiary: Identifiable {
    var id = UUID()
    public var name: String
    public var city: String
    public var registrationNumber: String
    public var hiveDescription: String
    
    @Relationship(deleteRule: .cascade)
    public var hives: [Hive]
    
    init(
        name: String,
        city: String,
        registrationNumber: String,
        hiveDescription: String,
        hives: [Hive]
    ) {
        self.name = name
        self.city = city
        self.registrationNumber = registrationNumber
        self.hiveDescription = hiveDescription
        self.hives = hives
    }
}
