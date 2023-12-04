//
//  EditFeedingView.swift
//  TrackBabyFeeding
//
//

import SwiftUI

struct EditFeedingView: View {
    @ObservedObject var viewModel: FeedingTrackerViewModel
    @State private var selectedType: FeedingType
    @State private var duration: String
    @State private var notes: String

    var record: FeedingRecord

    init(viewModel: FeedingTrackerViewModel, record: FeedingRecord) {
        self.viewModel = viewModel
        self._selectedType = State(initialValue: record.type)
        self._duration = State(initialValue: "\(Int(record.duration / 60))")
        self._notes = State(initialValue: record.notes ?? "") 
        self.record = record
    }

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
            
            Section {
                Button(action: updateFeedingRecord) {
                    Text("Update Feeding Record")
                }
            }
        }
        .navigationBarTitle("Edit Feeding")
    }

    private func updateFeedingRecord() {
        guard let newDuration = Double(duration) else { return }
        viewModel.editFeedingRecord(record, newType: selectedType, newDuration: newDuration, newNotes: notes)
    }
}


