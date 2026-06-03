import SwiftUI

struct InspectionDetailView: View {
    @State private var viewModel: InspectionDetailViewModel
    
    var body: some View {
        // TODO: Add this screen ⬇️
        Text("Hello, World!")
        Text("InspectionDetailView")
    }
    
    init(inspection: Inspections) {
        self.viewModel = InspectionDetailViewModel(inspection: inspection)
    }
}

#Preview {
    InspectionDetailView(
        inspection: .init(
            haveQueen: false,
            numbersOfOccupiedFrames: 10,
            areEggsPresented: false,
            areQueenCellsPresented: false,
            areDroneCellsPresented: false,
            numberOfFreeFrames: .none,
            pollen: .none,
            honey: .none,
            cappedBrood: .none,
            uncappedBrood: .none,
            colonyStrenght: .medium,
            broodPattern: .solid,
            beeBehavior: .calm,
            pestsAndDiseases: .ants,
            hiveHygiene: .cleanHive,
            swormingState: .none,
            notes: "",
            dateOfCreation: .now
        )
    )
}
