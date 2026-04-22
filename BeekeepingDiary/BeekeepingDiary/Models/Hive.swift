import SwiftData
import Foundation

@Model
class Hive: Identifiable {
    var id = UUID()
    public var hiveType: HiveTypes
    public var numberOfFrames: Int
    // should be of type Image or something like this
    public var image: String
    
    @Relationship(deleteRule: .cascade)
    public var inspections: [Inspections] = []
    
    public var apiary: Apiary?
    
    init(
        inspections: [Inspections],
        hiveType: HiveTypes,
        numberOfFrames: Int,
        image: String
    ) {
        self.inspections = inspections
        self.hiveType = hiveType
        self.numberOfFrames = numberOfFrames
        self.image = image
    }
}

enum HiveTypes: String, CaseIterable, Codable {
    case langstroth = "Langstroth Hive"
    case topBar = "Top-Bar Hive"
    case warre = "Warre Hive"
    case dadant = "Dadant Hive"
    case britishNational = "British National Hive"
    case flow = "Flow Hive"
    case layens = "Layens Hive"
    case skep = "Skep Hive"
    case longLangstroth = "Long Langstroth Hive"
    case log = "Log (Gum) Hive"
    case other = "Other"
}
