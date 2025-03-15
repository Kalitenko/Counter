//
//  ViewController.swift
//  Counter
//
//  Created by Bogdan Kalitenko on 12.03.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    private var count: Int = 0
    private var history: String = "История изменений:"
    private var counterText: String = "Значение счётчика: "
    
    private let dateFormatter: DateFormatter = DateFormatter()
    
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "[dd.MM.yy HH:mm:ss]"
        historyTextView.isEditable = false
        
    }

    @IBAction private func plusButton(_ sender: Any) {
        count += 1

        ptintText(stringAboutAction: "значение изменено на +1")
    }
    @IBAction private func minusButton(_ sender: Any) {
        if count == 0 {

            ptintText(stringAboutAction: "попытка уменьшить значение счётчика ниже 0")
            return
        }
        count -= 1

        ptintText(stringAboutAction: "значение изменено на -1")

    }
    @IBAction private func resetButton(_ sender: Any) {
        count = 0

        ptintText(stringAboutAction: "значение сброшено")
    }
    
    private func refreshCounter() {
        counterLabel.text = counterText + count.description
    }
    private func getFormattedDate() -> String {
        return dateFormatter.string(from: Date())
        
    }
    private func ptintText(stringAboutAction: String) {
        historyTextView.text = historyTextView.text
        + "\n\(getFormattedDate()): \(stringAboutAction)"
        historyTextView.scrollRangeToVisible(NSRange(location: historyTextView.text.count - 1, length: 1))
        refreshCounter()
    }
}

