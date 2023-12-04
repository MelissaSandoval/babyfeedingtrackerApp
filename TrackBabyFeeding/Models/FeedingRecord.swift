//
//  FeedingRecord.swift
//  TrackBabyFeeding
//
//

import Foundation

struct FeedingRecord: Identifiable {
    var id = UUID()
    var time: Date
    var type: FeedingType
    var duration: TimeInterval
    var notes: String?
}

enum FeedingType {
    case breastfeeding
    case bottlefeeding
}
