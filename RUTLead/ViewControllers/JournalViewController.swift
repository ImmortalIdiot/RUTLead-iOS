//
//  JournalViewController.swift
//  RUTLead
//
//  Created by Michael Kivo on 29/02/2024.
//

import UIKit
import SnapKit

final class JournalViewController: UIViewController {
    
    // MARK: Properties
    
    private var mainTitle: UILabel = {
        let label = UILabel()
        label.text = "Журнал"
        label.textColor = Colors.placeHolder
        label.font = .systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()

    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        addSubviews()
        setUpConstraints()
    }
    
    private func setUp() {
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(mainTitle)
    }
    
    private func setUpConstraints() {
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalToSuperview().offset(20)
        }
        
        
    }

}
