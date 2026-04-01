//
//  AddNewInspectionView.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 4.03.26.
//

import SwiftUI

struct AddNewInspectionScreen: View {
    var body: some View {
        NavigationStack {
         //✅✅✅ See the notes!!! ✅✅✅
        }
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
