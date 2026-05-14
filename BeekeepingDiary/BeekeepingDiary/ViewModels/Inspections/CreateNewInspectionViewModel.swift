import SwiftData
import Foundation

@Observable
class CreateNewInspectionViewModel {
    var inspection: Inspections = .init(
        haveBrood: false,
        haveQueen: false,
        haveHoney: false,
        havePolen: false,
        numbersOfFrames: 0,
        haveFreeFrames: false,
        numberOfFreeFrames: 0,
        areEggsPresented: false,
        areQueenCellsPresented: false,
        areDroneCellsPresented: false,
        colonyStrenght: .weak,
        broodPattern: .other,
        beeBehavior: .calm,
        pestsAndDiseases: .none,
        hiveHygiene: .cleanHive,
        swormingState: .none,
        notes: "",
        dateOfCreation: .now
    )
}
