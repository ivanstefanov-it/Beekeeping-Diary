import SwiftData
import Foundation
import Observation

@Observable
class HiveDetailViewModel {
    var hive: Hive
    
    init(hive: Hive) {
        self.hive = hive
    }
    
    func delete(modelContext: ModelContext, inspection: Inspections) {
        modelContext.delete(inspection)
        try? modelContext.save()
    }
}
