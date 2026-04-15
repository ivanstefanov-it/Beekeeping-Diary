import SwiftUI

struct CreateNewApiaryScreen: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = CreateNewApiaryViewModel()
    @FocusState private var isNameFocused: Bool
    
    private var isFormValid: Bool {
        !viewModel.name.isEmpty &&
        !viewModel.city.isEmpty
    }
    
    var body: some View {
        Form {
            TextField("Enter a name", text: $viewModel.name)
                .focused($isNameFocused)
            TextField("Enter a city", text: $viewModel.city)
            TextField("Registration Number", text: $viewModel.registrationNumber)
            TextField("Add some description", text: $viewModel.apiaryDescription, axis: .vertical)
                .lineLimit(5...10)
        }
        .navigationTitle("New Apiary")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    viewModel.save(context: context)
                    dismiss()
                }
                .disabled(!isFormValid)
            }
        }
        .onAppear {
            isNameFocused = true
        }
    }
}

#Preview {
    CreateNewApiaryScreen()
}
