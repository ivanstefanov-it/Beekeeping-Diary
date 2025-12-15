import Foundation

struct Hive {
    public var inspections: [Inspections]
    public var hiveType: HiveTypes
    public var numberOfFrames: Int
    // should be of type Image or something like this
    public var image: String
    
    enum HiveTypes: String, CaseIterable {
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
}
