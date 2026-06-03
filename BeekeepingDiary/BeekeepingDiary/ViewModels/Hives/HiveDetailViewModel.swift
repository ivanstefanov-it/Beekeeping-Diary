import SwiftData
import Foundation
import Observation

@Observable
class HiveDetailViewModel {
    var hive: Hive
    
    init(hive: Hive) {
        self.hive = hive
    }
    
    func delete(modelContext: ModelContext, _ indexSet: IndexSet) {
        for i in indexSet {
            let inspection = hive.inspections[i]
            modelContext.delete(inspection)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to delete inspection:", error)
        }
    }
}
