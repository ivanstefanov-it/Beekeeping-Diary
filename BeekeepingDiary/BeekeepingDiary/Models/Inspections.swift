import SwiftData
import Foundation

@Model
class Inspections: Identifiable {
    var id = UUID()
    public var haveQueen: Bool
    public var numbersOfOccupiedFrames: Int
    public var areEggsPresented: Bool
    public var areQueenCellsPresented: Bool
    public var areDroneCellsPresented: Bool
    public var numberOfFreeFrames: FramesCount
    public var pollen: FramesCount
    public var honey: FramesCount
    public var cappedBrood: FramesCount
    public var uncappedBrood: FramesCount
    public var colonyStrenght: ColonyStrenght?
    public var broodPattern: BroodPattern?
    public var beeBehavior: BeeBehavior?
    public var pestsAndDiseases: PestsAndDiseases?
    public var hiveHygiene: HiveHygiene?
    public var swormingState: SwormState?
    public var notes: String
    public var dateOfCreation: Date
    
    public var hive: Hive?
    
    enum ColonyStrenght: String, Codable, CaseIterable, Identifiable {
        case weak = "Weak colony"
        case medium = "Medium colony"
        case strong = "Strong colony"
        
        var id: Self { self }
    }
    
    enum BroodPattern: String, Codable, CaseIterable, Identifiable {
        case solid = "Solid brood"
        case mostlySolid = "Mostly solid brood"
        case spotty = "Spotty"
        case other = "Other"
        
        var id: Self { self }
    }
    
    enum FramesCount: String, Codable, CaseIterable, Identifiable {
        case none = "None"
        case oneFrame = "One frame"
        case fewFrames = "Few frames"
        case severalFrames = "Several frames"
        case manyFrames = "Many frames"
        case all = "All"
        
        var id: Self { self }
    }
    
    enum BeeBehavior: String, Codable, CaseIterable, Identifiable {
        case calm, aggressive
        
        var id: Self { self }
    }
    
    enum PestsAndDiseases: String, Codable, CaseIterable, Identifiable {
        case smallHiveBeetle, waxMoths, hornetsAndWasps, ants, mice, robbery, varroaMites, other, none
        
        var id: Self { self }
    }
    
    enum HiveHygiene: String, Codable, CaseIterable, Identifiable {
        case cleanHive, deadBeesOnBottomBoard, deadBeesInFeeder, deadBeesAtHiveEntrance, brownSpotsOnLandingBoard, foulOdor, excessiveBracingComb, americanFoulbrood, europeanFoulbrood
        
        var id: Self { self }
    }
    
    enum SwormState: String, Codable, CaseIterable, Identifiable {
        case none, earlySigns, imminentSwarming, activeSwarming, postSwarm
        
        var id: Self { self }
    }
    
    init(
        haveQueen: Bool,
        numbersOfOccupiedFrames: Int,
        areEggsPresented: Bool,
        areQueenCellsPresented: Bool,
        areDroneCellsPresented: Bool,
        numberOfFreeFrames: FramesCount,
        pollen: FramesCount,
        honey: FramesCount,
        cappedBrood: FramesCount,
        uncappedBrood: FramesCount,
        colonyStrenght: ColonyStrenght?,
        broodPattern: BroodPattern?,
        beeBehavior: BeeBehavior?,
        pestsAndDiseases: PestsAndDiseases?,
        hiveHygiene: HiveHygiene?,
        swormingState: SwormState?,
        notes: String,
        dateOfCreation: Date = .now
    ) {
        self.haveQueen = haveQueen
        self.numbersOfOccupiedFrames = numbersOfOccupiedFrames
        self.numberOfFreeFrames = numberOfFreeFrames
        self.areEggsPresented = areEggsPresented
        self.areQueenCellsPresented = areQueenCellsPresented
        self.areDroneCellsPresented = areDroneCellsPresented
        self.pollen = pollen
        self.honey = honey
        self.cappedBrood = cappedBrood
        self.uncappedBrood = uncappedBrood
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
