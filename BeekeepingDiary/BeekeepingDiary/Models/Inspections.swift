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
    // how strong is the colony
    public var colonyStrenght: ColonyStrenght
    public var broodPattern: BroodPattern
    public var beeBehavior: BeeBehavior
    // could be one or many (maybe create a enum with all variants)
    public var pestsAndDiseases: Bool
    public var hiveHygiene: HiveHygiene
    public var swormingState: SwormState
    public var notes: String
    
    enum ColonyStrenght {
        case weak, medium, strong
    }
    
    enum BroodPattern {
        
    }
    
    enum BeeBehavior {
        case calm, aggressive
    }
    
    enum HiveHygiene {
        
    }
    
    enum SwormState {
        
    }
}
