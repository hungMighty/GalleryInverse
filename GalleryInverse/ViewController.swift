//
//  ViewController.swift
//  GalleryInverse
//
//  Created by Fury on 6/4/17.
//  Copyright © 2017 Fury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    // MARK: Table Sections enum
    fileprivate enum Sections: Int {
        case profile = 0, desires

        static var count: Int { return Sections.desires.rawValue + 1 }
    }
    fileprivate let sectionsTitles = [Sections.profile: "Profile",
                                       Sections.desires: "Desires"
    ]
    fileprivate let numberOfCellsPerSection: [Sections: Int] = [
        Sections.profile: ProfileCells.count,
        Sections.desires: DesireCells.count
    ]

    // MARK: Profile Cells enum
    fileprivate enum ProfileCells: Int {
        case userName = 0, cellPhone, nickName, gender

        static var count: Int { return ProfileCells.gender.rawValue + 1 }
    }
    fileprivate let profileCellsIdentifiers: [ProfileCells: String] = [
        ProfileCells.userName: TwoLabelsCell.identifier,
        ProfileCells.cellPhone: TwoLabelsCell.identifier,
        ProfileCells.nickName: TwoLabelsCell.identifier,
        ProfileCells.gender: TwoLabelsCell.identifier
    ]
    fileprivate let profileCellsTitles: [ProfileCells: String] = [
        ProfileCells.userName: "Username",
        ProfileCells.cellPhone: "Cell Phone",
        ProfileCells.nickName: "Nick Name",
        ProfileCells.gender: "Gender"
    ]
    fileprivate let profileCellsValues: [ProfileCells: String] = [
        ProfileCells.userName: "Hung Mighty",
        ProfileCells.cellPhone: "099 378 5485",
        ProfileCells.nickName: "Ahri",
        ProfileCells.gender: "Male"
    ]

    // MARK: Desire Cells enum
    fileprivate enum DesireCells: Int {
        case lover = 0, school, targetSalary

        static var count: Int { return DesireCells.targetSalary.rawValue + 1 }
    }
    fileprivate let desireCellsIdentifiers: [DesireCells: String] = [
        DesireCells.lover: TwoLabelsCell.identifier,
        DesireCells.school: TwoLabelsCell.identifier,
        DesireCells.targetSalary: TwoLabelsCell.identifier
    ]
    fileprivate let desireCellsTitles: [DesireCells: String] = [
        DesireCells.lover: "Lover",
        DesireCells.school: "School",
        DesireCells.targetSalary: "Target Salary"
    ]
    fileprivate let desireCellsValues: [DesireCells: String] = [
        DesireCells.lover: "Ahri",
        DesireCells.school: "RMIT",
        DesireCells.targetSalary: "Over 100K"
    ]

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sectionEnum = Sections(rawValue: section), let sectionTitle = sectionsTitles[sectionEnum] else {
            return ""
        }
        return sectionTitle
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionEnum = Sections(rawValue: section), let rowCount = numberOfCellsPerSection[sectionEnum] else {
            return 0
        }
        return rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = getCellIndentifier(indexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier:
            identifier, for: indexPath)
        if identifier == TwoLabelsCell.identifier {
            guard let twoLabelsCell = cell as? TwoLabelsCell else {
                return cell
            }
            let (title, value) = getTwoLabelsCellData(indexPath: indexPath)
            twoLabelsCell.populateData(title: title, value: value)
        }

        return cell
    }

    fileprivate func getCellIndentifier(indexPath: IndexPath) -> String {
        switch indexPath.section {
        case Sections.profile.rawValue:
            guard let cellEnum = ProfileCells(rawValue: indexPath.row),
                let indentifier = profileCellsIdentifiers[cellEnum] else {
                return "TwoLabelsCell"
            }
            return indentifier
        case Sections.desires.rawValue:
            guard let cellEnum = DesireCells(rawValue: indexPath.row),
                let indentifier = desireCellsIdentifiers[cellEnum] else {
                    return "TwoLabelsCell"
            }
            return indentifier
        default:
            break
        }
        return "TwoLabelsCell"
    }

    fileprivate func getTwoLabelsCellData(indexPath: IndexPath) -> (String, String) {
        switch indexPath.section {
        case Sections.profile.rawValue:
            guard let cellEnum = ProfileCells(rawValue: indexPath.row),
                let title = profileCellsTitles[cellEnum],
                let value = profileCellsValues[cellEnum] else {
                    return ("", "")
            }
            return (title, value)
        case Sections.desires.rawValue:
            guard let cellEnum = DesireCells(rawValue: indexPath.row),
                let title = desireCellsTitles[cellEnum],
                let value = desireCellsValues[cellEnum] else {
                    return ("", "")
            }
            return (title, value)
        default:
            break
        }

        return ("", "")
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let identifier = getCellIndentifier(indexPath: indexPath)
        switch identifier {
        case TwoLabelsCell.identifier:
            return 60
        default:
            break
        }

        return 20
    }
}
