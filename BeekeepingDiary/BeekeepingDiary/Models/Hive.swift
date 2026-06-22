import SwiftData
import Foundation

@Model
class Hive: Identifiable {
    var id = UUID()
    var hiveType: HiveTypes
    var numberOfFrames: Int
    var image: Data?
    
    @Relationship(deleteRule: .cascade)
    var inspections: [Inspections] = []
    @Relationship(deleteRule: .cascade)
    var tasks: [BeekeepingTask] = []
    
    var apiary: Apiary?
    
    init(
        inspections: [Inspections],
        hiveType: HiveTypes,
        numberOfFrames: Int,
        image: Data? = nil
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
