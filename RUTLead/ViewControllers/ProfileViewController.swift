//
//  ProfileViewController.swift
//  RUTLead
//
//  Created by Michael Kivo on 29/02/2024.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    // MARK: Properties
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Here will be profile..."
        label.textColor = .black
        label.font = UIFont(name: "Arial", size: 20)
        
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
        view.addSubview(label)
    }
    
    private func setUpConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

}
