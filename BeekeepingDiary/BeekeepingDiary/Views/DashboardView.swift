//
//  ContentView.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 5.12.25.
//

import SwiftUI

struct DashboardView: View {
    var isEmpty: Bool = true
    
    var body: some View {
        NavigationStack {
            if isEmpty {
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
                List(0..<100) { i in
                    Text("Row \(i)")
                }
                .navigationTitle("Beekeeping diary")
                .navigationBarTitleDisplayMode(.inline)
//                List {
//                    Section("Test") {
//                     Text("hives")
//                    }
//                }
            }
//            .navigationTitle("Beekeeping diary")
//            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    DashboardView()
}
