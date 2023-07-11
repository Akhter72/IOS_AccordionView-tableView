//
//  SectionHeader.swift
//  AccordionView
//
//  Created by Mac on 07/07/23.
//

import UIKit

class SectionHeader: UIView {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var showBtn: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var selectedData: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed("SectionHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.layer.cornerRadius = 15
    }

}
