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
    
    func delete(modelContext: ModelContext, _ indexSet: IndexSet) {
        for i in indexSet {
            let hive = apiary.hives[i]
            modelContext.delete(hive)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to delete hive:", error)
        }
    }
}
