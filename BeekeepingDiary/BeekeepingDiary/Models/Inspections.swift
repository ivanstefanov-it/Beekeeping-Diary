import Foundation

struct Inspections {
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
    
    enum ColonyStrenght {
        case weak, medium, strong
    }
    
    enum BroodPattern {
        case solid, mostlySolid, spotty, other
    }
    
    enum BeeBehavior {
        case calm, aggressive
    }
    
    enum PestsAndDiseases {
        case smallHiveBeetle, waxMoths, hornetsAndWasps, ants, mice, robbery, varroaMites, other
    }
    
    enum HiveHygiene {
        case cleanHive, deadBeesOnBottomBoard, deadBeesInFeeder, deadBeesAtHiveEntrance, brownSpotsOnLandingBoard, foulOdor, excessiveBracingComb, americanFoulbrood, europeanFoulbrood
    }
    
    enum SwormState {
        case none, earlySigns, imminentSwarming, activeSwarming, postSwarm
    }
}
