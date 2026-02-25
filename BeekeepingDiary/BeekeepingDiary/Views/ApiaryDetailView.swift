//
//  ApiaryDetailView.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 11.02.26.
//

import SwiftUI

struct ApiaryDetailView: View {
    
    @State private var viewModel: ApiaryDetailViewModel
    
    init(apiary: Apiary) {
        viewModel = ApiaryDetailViewModel(apiary: apiary)
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Label(viewModel.apiary.name, systemImage: "leaf")
                    Label(viewModel.apiary.city, systemImage: "mappin.and.ellipse")
                    Label(viewModel.apiary.registrationNumber, systemImage: "number")
                    Label(viewModel.apiary.description, systemImage: "text.alignleft")
                    Label(viewModel.apiary.hives.count.description, systemImage: "square.grid.2x2")
                }
                
                Section("Hives") {
                    ForEach(viewModel.sortedHivesByFrames) { hive in
                        NavigationLink {
                            HiveDetailView(hive: hive)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(hive.hiveType.rawValue)
                                    .fontWeight(.bold)
                                Text("number of frames: \(hive.numberOfFrames)")
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ApiaryDetailView(
        apiary: .init(
            name: "Apiary Name",
            city: "Sofia",
            registrationNumber: "123qwerty456",
            description: "The best apiary",
            hives: [.init(hiveType: .dadant, numberOfFrames: 10, image: "")]
        )
    )
}
