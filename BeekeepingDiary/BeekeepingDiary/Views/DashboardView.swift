//
//  ContentView.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 5.12.25.
//

import SwiftUI

struct DashboardView: View {
    @State private var viewModel = DashboardViewModel()
    
    var body: some View {
        NavigationStack {
            if viewModel.allApiaries.isEmpty {
                HStack {
                    Button {
                        withAnimation(.smooth) {
                            print("Open add new apiary screen")
                        }
                    } label: {
                        HStack {
                            Text("Add new apiary")
                            
                            Image(systemName: "flame")
                        }
                        .frame(width: 190, height: 46)
                        .foregroundColor(.black)
                        .background(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [.pink, /*.cyan,*/ .indigo]
                                ),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(.capsule)
                    }
                }
            } else {
                List {
                    ForEach(viewModel.allApiaries) { apiary in
                        NavigationLink {
                            ApiaryDetailView(apiary: apiary)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(apiary.name)
                                    .fontWeight(.bold)
                                Text("number of hives: \(apiary.hives.count)")
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Beekeeping diary")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            viewModel.load()
        }
    }
}

#Preview {
    DashboardView()
}
