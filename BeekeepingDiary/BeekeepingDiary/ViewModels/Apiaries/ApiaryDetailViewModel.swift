import SwiftData
import Foundation
import Observation

@Observable
class ApiaryDetailViewModel {
    var apiary: Apiary
    
    init(apiary: Apiary) {
        self.apiary = apiary
    }
    
    var sortedHivesByType: [Hive] {
        apiary.hives.sorted { $0.hiveType.rawValue < $1.hiveType.rawValue }
    }
    
    var sortedHivesByFrames: [Hive] {
        apiary.hives.sorted { $0.numberOfFrames < $1.numberOfFrames }
    }
    
    func delete(modelContext: ModelContext, hive: Hive) {
        modelContext.delete(hive)
        try? modelContext.save()
    }
}
