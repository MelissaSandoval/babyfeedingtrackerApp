//
//  CalendarView.swift
//  TrackBabyFeeding
//
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack {
            FSCalendarWrapper()
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("Calendar")
                .navigationBarTitleDisplayMode(.inline)
            Spacer()

            Text("Coming Soon!")
                .foregroundColor(.gray)
                .font(.headline)
                .padding()
            
            Spacer()
        }
    }
}

