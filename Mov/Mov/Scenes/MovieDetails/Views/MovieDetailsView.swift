//
//  MovieDetailsView.swift
//  Mov
//
//  Created by Miguel Nery on 01/11/18.
//  Copyright © 2018 Miguel Nery. All rights reserved.
//
import UIKit

public class MovieDetailsView: UIView {

    // UI Elements
    lazy var poster: UIImageView = {
        let poster = UIImageView(frame: .zero)
        poster.contentMode = .scaleAspectFit
        
        return poster
    }()
    
    lazy var tableView: MovieDetailsTableView = {
        return MovieDetailsTableView()
    }()
    
    // Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieDetailsView: ViewCode {
    
    public func addView() {
        self.addSubview(self.poster)
        self.addSubview(self.tableView)
    }
    
    public func addConstraints() {
        self.poster.snp.makeConstraints { make in
            make.top.equalToSuperview().multipliedBy(0.8)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(45)
        }
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.poster).multipliedBy(0.8)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
}

