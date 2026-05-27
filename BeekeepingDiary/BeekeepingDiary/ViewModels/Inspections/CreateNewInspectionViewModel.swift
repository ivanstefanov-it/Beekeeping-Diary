import SwiftData
import Foundation

@Observable
class CreateNewInspectionViewModel {
    private let hive: Hive
    
    var inspection: Inspections = .init(
        haveQueen: false,
        numbersOfOccupiedFrames: 0,
        areEggsPresented: false,
        areQueenCellsPresented: false,
        areDroneCellsPresented: false,
        numberOfFreeFrames: .none,
        pollen: .none,
        honey: .none,
        cappedBrood: .none,
        uncappedBrood: .none,
        colonyStrenght: nil,
        broodPattern: nil,
        beeBehavior: nil,
        pestsAndDiseases: nil,
        hiveHygiene: nil,
        swormingState: nil,
        notes: "",
        dateOfCreation: .now
    )
    
    init(hive: Hive) {
        self.hive = hive
    }
    
    func save(context: ModelContext) {
//        inspection.hive = hive
        hive.inspections.append(inspection)
        
        context.insert(inspection)
        
        do {
            try context.save()
        } catch {
            print("Failed to save inspection:", error)
        }
    }
}
