import SwiftData
import Foundation

@Observable
class CreateNewInspectionViewModel {
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
}
