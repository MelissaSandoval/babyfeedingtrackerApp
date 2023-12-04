//
//  FeedingTrackerViewModel.swift
//  TrackBabyFeeding
//
//

import Foundation

class FeedingTrackerViewModel: ObservableObject {
    @Published var feedingRecords: [FeedingRecord] = []
    @Published var showConfirmation = false

    func addFeedingRecord(type: FeedingType, duration: TimeInterval, notes: String?) {
        let newRecord = FeedingRecord(time: Date(), type: type, duration: duration, notes: notes)
        feedingRecords.append(newRecord)
        showConfirmation = true
    }

    func editFeedingRecord(_ record: FeedingRecord, newType: FeedingType, newDuration: TimeInterval, newNotes: String?) {
        guard let index = feedingRecords.firstIndex(where: { $0.id == record.id }) else { return }
        feedingRecords[index].type = newType
        feedingRecords[index].duration = newDuration
        feedingRecords[index].notes = newNotes
        showConfirmation = true
    }
}
