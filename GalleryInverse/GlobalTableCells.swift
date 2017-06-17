//
//  GlobalTableCells.swift
//  GalleryInverse
//
//  Created by Ahri on 6/17/17.
//  Copyright © 2017 Fury. All rights reserved.
//

import Foundation
import UIKit

class TwoLabelsCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    static let identifier = "TwoLabelsCell"

    func populateData(title: String, value: String) {
        self.titleLabel.text = title
        self.valueLabel.text = value
    }
}
