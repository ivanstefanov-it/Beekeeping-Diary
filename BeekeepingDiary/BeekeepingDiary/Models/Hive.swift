import SwiftUI
import SwiftData
import Foundation

@Model
class Hive: Identifiable {
    var id = UUID()
    var hiveType: HiveTypes
    var numberOfFrames: Int
    var image: Data?
    var queenColor: QueenColor
    
    @Relationship(deleteRule: .cascade)
    var inspections: [Inspections] = []
    @Relationship(deleteRule: .cascade)
    var tasks: [BeekeepingTask] = []
    
    var apiary: Apiary?
    
    init(
        inspections: [Inspections],
        hiveType: HiveTypes,
        numberOfFrames: Int,
        image: Data? = nil,
        queenColor: QueenColor
    ) {
        self.inspections = inspections
        self.hiveType = hiveType
        self.numberOfFrames = numberOfFrames
        self.image = image
        self.queenColor = queenColor
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

enum QueenColor: String, Codable, Hashable, CaseIterable {
    case blue
    case white
    case yellow
    case red
    case green
    case none
    
    var shortDisplayName: String {
        switch self {
        case .blue: "Blue"
        case .white: "White"
        case .yellow: "Yellow"
        case .red: "Red"
        case .green: "Green"
        case .none: "No Mark"
        }
    }
    
    var displayName: String {
        switch self {
        case .blue: "Blue (Years ending in 0 or 5)"
        case .white: "White (Years ending in 1 or 6)"
        case .yellow: "Yellow (Years ending in 2 or 7)"
        case .red: "Red (Years ending in 3 or 8)"
        case .green: "Green (Years ending in 4 or 9)"
        case .none: "No Mark"
        }
    }
}


extension QueenColor {
    var swiftUIColor: Color {
        switch self {
        case .blue: .blue
        case .white: .white
        case .yellow: .yellow
        case .red: .red
        case .green: .green
        case .none: .gray
        }
    }
}
