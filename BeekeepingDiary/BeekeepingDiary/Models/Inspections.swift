import SwiftData
import Foundation

@Model
class Inspections: Identifiable {
    var id = UUID()
    public var haveBrood: Bool
    public var haveQueen: Bool
    public var haveHoney: Bool
    public var havePolen: Bool
    public var numbersOfFrames: Int
    public var haveFreeFrames: Bool
    public var numberOfFreeFrames: Int
    public var areEggsPresented: Bool
    public var areQueenCellsPresented: Bool
    public var areDroneCellsPresented: Bool
    public var colonyStrenght: ColonyStrenght
    public var broodPattern: BroodPattern
    public var beeBehavior: BeeBehavior
    public var pestsAndDiseases: PestsAndDiseases
    public var hiveHygiene: HiveHygiene
    public var swormingState: SwormState
    public var notes: String
    public var dateOfCreation: Date
    
    public var hive: Hive?
    
    enum ColonyStrenght: Codable {
        case weak, medium, strong
    }
    
    enum BroodPattern: Codable {
        case solid, mostlySolid, spotty, other
    }
    
    enum BeeBehavior: Codable {
        case calm, aggressive
    }
    
    enum PestsAndDiseases: Codable {
        case smallHiveBeetle, waxMoths, hornetsAndWasps, ants, mice, robbery, varroaMites, other, none
    }
    
    enum HiveHygiene: Codable {
        case cleanHive, deadBeesOnBottomBoard, deadBeesInFeeder, deadBeesAtHiveEntrance, brownSpotsOnLandingBoard, foulOdor, excessiveBracingComb, americanFoulbrood, europeanFoulbrood
    }
    
    enum SwormState: Codable {
        case none, earlySigns, imminentSwarming, activeSwarming, postSwarm
    }
    
    init(
        haveBrood: Bool,
        haveQueen: Bool,
        haveHoney: Bool,
        havePolen: Bool,
        numbersOfFrames: Int,
        haveFreeFrames: Bool,
        numberOfFreeFrames: Int,
        areEggsPresented: Bool,
        areQueenCellsPresented: Bool,
        areDroneCellsPresented: Bool,
        colonyStrenght: ColonyStrenght,
        broodPattern: BroodPattern,
        beeBehavior: BeeBehavior,
        pestsAndDiseases: PestsAndDiseases,
        hiveHygiene: HiveHygiene,
        swormingState: SwormState,
        notes: String,
        dateOfCreation: Date = .now
    ) {
        self.haveBrood = haveBrood
        self.haveQueen = haveQueen
        self.haveHoney = haveHoney
        self.havePolen = havePolen
        self.numbersOfFrames = numbersOfFrames
        self.haveFreeFrames = haveFreeFrames
        self.numberOfFreeFrames = numberOfFreeFrames
        self.areEggsPresented = areEggsPresented
        self.areQueenCellsPresented = areQueenCellsPresented
        self.areDroneCellsPresented = areDroneCellsPresented
        self.colonyStrenght = colonyStrenght
        self.broodPattern = broodPattern
        self.beeBehavior = beeBehavior
        self.pestsAndDiseases = pestsAndDiseases
        self.hiveHygiene = hiveHygiene
        self.swormingState = swormingState
        self.notes = notes
        self.dateOfCreation = dateOfCreation
    }
}
