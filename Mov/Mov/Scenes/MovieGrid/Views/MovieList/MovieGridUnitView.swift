//
//  MovieGridUnit.swift
//  Mov
//
//  Created by Miguel Nery on 27/10/18.
//  Copyright © 2018 Miguel Nery. All rights reserved.
//

import UIKit
import SnapKit

class MovieGridUnitView: UIView {
    
    let imageFetcher: ImageFetcher = ImageKingFisherGateway()
    
    var viewModel: MovieGridViewModel = .placeHolder {
        didSet {
            self.viewModel.fetchImage(to: self.poster)
            self.title.text = self.viewModel.title
            self.isFavoriteButton.setImage(self.viewModel.isFavoriteIcon, for: .normal)
        }
    }
    
    // UI Elements
    lazy var poster: UIImageView = {
        let poster = UIImageView(frame: .zero)
        self.viewModel.fetchImage(to: poster)
        
        return poster
    }()
    
    lazy var title: UILabel = {
        let title = UILabel(frame: .zero)
        title.text = self.viewModel.title
        title.textAlignment = .center
        title.textColor = Colors.lightYellow
        title.font = UIFont(name: Fonts.helveticaNeue, size: CGFloat(20).proportionalToHeight)
        
        return title
    }()
    
    lazy var isFavoriteButton: UIButton = {
        let isFavoriteButton = UIButton(frame: .zero)
        isFavoriteButton.setImage(self.viewModel.isFavoriteIcon, for: .normal)
        isFavoriteButton.imageView!.contentMode = .scaleAspectFit

        return isFavoriteButton
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

extension MovieGridUnitView: ViewCode {
    
    public func addView() {
        self.addSubview(self.poster)
        self.addSubview(self.title)
        self.addSubview(self.isFavoriteButton)
    }
    
    public func addConstraints() {
        self.poster.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.80)
        }
        
        self.title.snp.makeConstraints { make in
            make.top.equalTo(self.poster.snp_bottomMargin)
            make.bottom.equalToSuperview()
            make.right.equalTo(self.isFavoriteButton.snp_leftMargin)
            make.centerX.equalToSuperview()
        }
        
        self.isFavoriteButton.snp.makeConstraints { make in
            make.top.equalTo(self.title.snp_topMargin)
            make.bottom.equalToSuperview()
//            make.centerY.equalTo(self.title.snp_centerYWithinMargins)
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.25)
        }
    }
    
    func additionalSetup() {
        self.backgroundColor = Colors.darkBlue
    }
    //oin eu sou o miguel e eu faço coisas de programação pq sou lyndo risos
    
}



