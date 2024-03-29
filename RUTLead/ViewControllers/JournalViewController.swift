//
//  JournalViewController.swift
//  RUTLead
//
//  Created by Michael Kivo on 29/02/2024.
//

import UIKit
import SnapKit
import FSCalendar

final class JournalViewController: UIViewController {
    
    // MARK: - Properties
    
    private var arrow: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.placeHolder
        view.alpha = 0.5
        
        return view
    }()
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.layer.borderColor = Colors.blueTabBar.cgColor
        calendar.layer.borderWidth = 3
        calendar.tintColor = Colors.blueTabBar
        calendar.locale = Locale(identifier: "ru")
        calendar.layer.cornerRadius = Helpers.cornerRadius
        calendar.firstWeekday = 2
        calendar.appearance.headerTitleColor = Colors.placeHolder
        calendar.appearance.todayColor = Colors.placeHolder
        calendar.appearance.weekdayTextColor = Colors.placeHolder
        calendar.appearance.selectionColor = Colors.blueTabBar
        calendar.appearance.titleDefaultColor = Colors.placeHolder
        calendar.appearance.titleFont = .systemFont(ofSize: 17, weight: .bold)
        calendar.appearance.headerTitleFont = .systemFont(ofSize: 17, weight: .bold)
        calendar.appearance.weekdayFont = .systemFont(ofSize: 17, weight: .semibold)
        calendar.appearance.subtitleFont = .systemFont(ofSize: 17, weight: .ultraLight)
        calendar.appearance.headerMinimumDissolvedAlpha = 0
        
        let leftButton = UIButton(type: .custom)
        leftButton.setImage(.init(systemName: "lessthan"), for: .normal)
        calendar.addSubview(leftButton)
        leftButton.frame = CGRect(x: 87, y: 8, width: 30, height: 30)
        leftButton.imageView?.tintColor = Colors.placeHolder
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        
        let rightButton = UIButton(type: .custom)
        rightButton.setImage(.init(systemName: "greaterthan"), for: .normal)
        calendar.addSubview(rightButton)
        rightButton.frame = CGRect(x: 235, y: 8, width: 30, height: 30)
        rightButton.imageView?.tintColor = Colors.placeHolder
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        
        return calendar
    }()
    
    private var disciplinesTitle: UILabel = {
        let label = UILabel()
        label.text = "Диспциплины"
        label.textColor = Colors.placeHolder
        label.font = .systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
        
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        addSubviews()
        setUpConstraints()
    }
    
    private func setUp() {
        view.backgroundColor = .white
        
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    private func addSubviews() {
        view.addSubview(calendar)
        calendar.addSubview(arrow)
        view.addSubview(disciplinesTitle)
    }
    
    private func setUpConstraints() {
        calendar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(300)
        }
        
        arrow.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(69)
        }
        
        disciplinesTitle.snp.makeConstraints { make in
            make.top.equalTo(calendar.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(18)
        }
    }
    
    @objc private func leftButtonTapped() {
        calendar.setCurrentPage(previousMonth(), animated: true)
        
        func previousMonth() -> Date {
            let currentDate = calendar.currentPage
            let previousMonthDate = Calendar.current.date(byAdding: .month, value: -1, to: currentDate)!
            return previousMonthDate
        }
    }
    
    @objc private func rightButtonTapped() {
        calendar.setCurrentPage(nextMonth(), animated: true)
        
        func nextMonth() -> Date {
            let currentDate = calendar.currentPage
            let nextMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate)!
            return nextMonthDate
        }
    }

}

extension JournalViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        
        print("Selected date: \(formatter.string(from: date))")
    }
}

extension JournalViewController: FSCalendarDataSource {
    
}
