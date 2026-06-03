import Foundation

@Observable
class InspectionDetailViewModel {
    var inspection: Inspections
    
    init(inspection: Inspections) {
        self.inspection = inspection
    }
}
