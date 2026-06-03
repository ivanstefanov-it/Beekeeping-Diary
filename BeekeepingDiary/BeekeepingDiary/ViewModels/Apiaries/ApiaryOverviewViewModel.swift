import SwiftData
import Foundation
import Observation

@Observable
class ApiaryOverviewViewModel {
    init() { }
    
    func delete(modelContext: ModelContext, _ indexSet: IndexSet, apiaries: [Apiary]) {
        for i in indexSet {
            let apiary = apiaries[i]
            modelContext.delete(apiary)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to delete apiary:", error)
        }
    }
    
}
