//
//  ContentView.swift
//  TrackBabyFeeding
//
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = FeedingTrackerViewModel()

    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(viewModel.feedingRecords) { record in
                        NavigationLink(destination: EditFeedingView(viewModel: viewModel, record: record)) {
                            FeedingRecordRow(record: record)
                                //.foregroundColor(.pink) // Apply pink color to list rows
                        }
                    }
                }
                .navigationBarTitle("Feeding Tracker")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                    NavigationLink(destination: AddFeedingView(viewModel: viewModel)) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.pink)
                            .padding()
                    }
                )
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Feeding Records")
            }

            NavigationView {
                CalendarView()
                    .navigationBarTitle("Calendar")
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Calendar")
            }
        }
        .accentColor(.pink) // this is the highlight color for buttns
        .onAppear {
            // I can fetch some data here later...
        }
        .alert(isPresented: $viewModel.showConfirmation) {
            Alert(
                title: Text("Feeding Added"),
                message: Text("You've successfully added a feeding time."),
                primaryButton: .default(Text("OK")) {
                    viewModel.showConfirmation = false
                },
                secondaryButton: .cancel()
            )
        }
    }
}

struct FeedingRecordRow: View {
    var record: FeedingRecord

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Time: \(formattedDate(record.time))")
                .font(.headline)
                .foregroundColor(.pink)
            Text("Type: \(record.type == .breastfeeding ? "Breastfeeding" : "Bottlefeeding")")
                .foregroundColor(.gray)
                .font(.subheadline)
            Text("Duration: \(formattedDuration(record.duration))")
                .foregroundColor(.gray)
                .font(.subheadline)
            if let notes = record.notes, !notes.isEmpty {
                Text("Notes: \(notes)")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .lineLimit(nil)//i wanted to make the space bigger
            }
        }
        .padding(12)
        .background(record.id.uuidString.hashValue % 2 == 0 ? Color.pink.opacity(0.1) : Color.pink.opacity(0.02)) // Alternate colors based on hashValue
        .cornerRadius(10)
        .shadow(radius: 2)
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, HH:mm"
        return formatter.string(from: date)
    }

    private func formattedDuration(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: duration) ?? ""
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
