//
//  FSCalendarWrapper.swift
//  TrackBabyFeeding
//
//

import SwiftUI
import FSCalendar

struct FSCalendarWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController

    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        }

    }

    func makeUIViewController(context: Context) -> UIViewController {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator

        return UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

