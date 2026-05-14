import SwiftUI

struct AddNewInspectionScreen: View {
    @State private var viewModel = CreateNewInspectionViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Is brood presented")
                Spacer()
                Picker("", selection: $viewModel.inspection.haveBrood) {
                    Text("Yes").tag(true)
                    Text("No").tag(false)
                }
                .pickerStyle(.segmented)
                .padding()
            }
            HStack {
                Text("Is brood presented")
                Spacer()
                Picker("", selection: $viewModel.inspection.haveBrood) {
                    Text("Yes").tag(true)
                    Text("No").tag(false)
                }
                .pickerStyle(.segmented)
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        // Add to the list of inspections
                    }, label: {
                        Text("Add")
                    })
                }
            }
    }
}

#Preview {
    AddNewInspectionScreen()
}
