//
//  AddFeedingView.swift
//  TrackBabyFeeding
//
//

import SwiftUI

struct AddFeedingView: View {
    @ObservedObject var viewModel: FeedingTrackerViewModel
    @State private var selectedType: FeedingType = .breastfeeding
    @State private var duration: String = ""
    @State private var notes: String = ""

    var body: some View {
        Form {
            Section(header: Text("Feeding Type")) {
                Picker("Type", selection: $selectedType) {
                    Text("Breastfeeding").tag(FeedingType.breastfeeding)
                    Text("Bottlefeeding").tag(FeedingType.bottlefeeding)
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("Feeding Duration")) {
                TextField("Duration (minutes)", text: $duration)
                    .keyboardType(.numberPad)
            }

            Section(header: Text("Notes")) {
                          TextEditor(text: $notes)
                              .frame(height: 120)
                              .cornerRadius(8)
                      }

            Section {
                            Button(action: addFeedingRecord) {
                                //Image(systemName: "checkmark.circle")
                                Text("Add Feeding")
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.pink)
                                    .cornerRadius(100)
                            }
                            .shadow(color: .pink, radius: 10, y: 5)
            }
        }
        .navigationBarTitle("Add Feeding")
    }

    private func addFeedingRecord() {
        guard let duration = Double(duration) else { return }
        viewModel.addFeedingRecord(type: selectedType, duration: duration * 60, notes: notes)
    }
}

