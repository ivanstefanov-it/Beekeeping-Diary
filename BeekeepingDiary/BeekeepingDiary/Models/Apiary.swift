import Foundation

struct Apiary: Hashable, Identifiable {
    let id = UUID()
    public var name: String
    public var city: String
    public var registrationNumber: String
    public var description: String
    public var hives: [Hive]
}
