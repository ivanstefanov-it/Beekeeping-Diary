//
//  AddNewHiveScreen.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 22.04.26.
//

import SwiftUI

struct AddNewHiveScreen: View {
    let apiary: Apiary
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = CreateNewHiveViewModel()
    @State private var numberFormatter: NumberFormatter = {
        var numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .none
        return numberFormatter
    }()
    
    var body: some View {
        Form {
            Picker("Hive type", selection: $viewModel.hiveType) {
                ForEach(HiveTypes.allCases, id: \.self) { type in
                    Text(type.rawValue.capitalized)
                }
            }
            TextField("Number of frames", value: $viewModel.numberOfFrames, formatter: numberFormatter)
                .keyboardType(.numberPad)
            // TODO: add image
        }
        .navigationTitle("New Hive")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    viewModel.save(context: context, apiary: apiary)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
//    AddNewHiveScreen()
}
