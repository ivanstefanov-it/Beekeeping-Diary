import SwiftUI
import PhotosUI

struct AddNewHiveScreen: View {
    let apiary: Apiary
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var viewModel = CreateNewHiveViewModel()
    
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var showPhotoPicker = false
    @State private var showCamera = false
    @State private var showSourceDialog = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack(spacing: 12) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemGray6))
                                .frame(height: 180)
                            
                            if let image = viewModel.previewImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 180)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            } else {
                                VStack {
                                    Image(systemName: "photo")
                                        .font(.system(size: 40))
                                        .foregroundColor(.gray)
                                    
                                    Text("Tap to add photo")
                                        .foregroundColor(.gray)
                                        .font(.subheadline)
                                }
                            }
                        }
                        .onTapGesture {
                            showSourceDialog = true
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                }
                
                Section("Hive Info") {
                    Picker("Hive type", selection: $viewModel.hiveType) {
                        ForEach(HiveTypes.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    
                    TextField("Number of frames", value: $viewModel.numberOfFrames, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("New Hive")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.save(context: context, apiary: apiary)
                        dismiss()
                    }
                }
            }
            .photosPicker(isPresented: $showPhotoPicker, selection: $photosPickerItem)
            .sheet(isPresented: $showCamera) {
                ImagePicker(image: $viewModel.previewImage)
            }
            .confirmationDialog("Select Image Source", isPresented: $showSourceDialog) {
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    Button {
                        showCamera = true
                    } label: {
                        Label("Take Photo", systemImage: "camera")
                    }
                }
                
                Button {
                    showPhotoPicker = true
                } label: {
                    Label("Choose from Library", systemImage: "photo")
                }
                
                if viewModel.previewImage != nil {
                    Button("Remove Photo", role: .destructive) {
                        viewModel.previewImage = nil
                        viewModel.setImage(nil)
                    }
                }
                
                Button("Cancel", role: .cancel) { }
            }
            .onChange(of: photosPickerItem) { _, newItem in
                viewModel.loadImage(from: newItem)
                photosPickerItem = nil
            }
        }
    }
}

#Preview {
    AddNewHiveScreen(
        apiary: .init(
            name: "Apiary name",
            city: "Sofia",
            registrationNumber: "1233121",
            apiaryDescription: "This is verry nice apiary",
            hives: [.init(
                inspections: [.init(
                    haveBrood: false,
                    haveQueen: false,
                    haveHoney: false,
                    havePolen: false,
                    numbersOfFrames: 10,
                    haveFreeFrames: false,
                    numberOfFreeFrames: 0,
                    areEggsPresented: false,
                    areQueenCellsPresented: false,
                    areDroneCellsPresented: false,
                    colonyStrenght: .medium,
                    broodPattern: .solid,
                    beeBehavior: .calm,
                    pestsAndDiseases: .ants,
                    hiveHygiene: .cleanHive,
                    swormingState: .none,
                    notes: "",
                    dateOfCreation: .now
                )],
                hiveType: .langstroth,
                numberOfFrames: 10,
                image: nil
            )]
        )
    )
}
