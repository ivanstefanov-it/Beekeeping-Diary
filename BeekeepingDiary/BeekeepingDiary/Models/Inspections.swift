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
        case calm = "Calm"
        case aggressive = "Aggressive"
        
        var id: Self { self }
    }
    
    enum PestsAndDiseases: String, Codable, CaseIterable, Identifiable {
        case smallHiveBeetle = "Small Hive Beetle"
        case waxMoths = "Wax Moths"
        case hornetsAndWasps = "Hornets and Wasps"
        case ants = "Ants"
        case mice = "Mice"
        case robbery = "Robbery"
        case varroaMites = "Varroa Mites"
        case other = "Other"
        case none = "None"
        
        var id: Self { self }
    }
    
    enum HiveHygiene: String, Codable, CaseIterable, Identifiable {
        case cleanHive = "Clean Hive"
        case deadBeesOnBottomBoard = "Dead Bees On Bottom Board"
        case deadBeesInFeeder = "Dead Bees In Feeder"
        case deadBeesAtHiveEntrance = "Dead Bees At Hive Entrance"
        case brownSpotsOnLandingBoard = "Brown Spots On Landing Board"
        case foulOdor = "Foul Odor"
        case excessiveBracingComb = "Excessive Bracing Comb"
        case americanFoulbrood = "American Foul brood"
        case europeanFoulbrood = "European Foul brood"
        case other = "Other"
        
        var id: Self { self }
    }
    
    enum SwormState: String, Codable, CaseIterable, Identifiable {
        case none = "None"
        case earlySigns = "EarlySigns"
        case imminentSwarming = "Imminent Swarming"
        case activeSwarming = "ActiveSwarming"
        case postSwarm = "Post Swarm"
        
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
