//
//  MainViewController.swift
//  MAMapKit
//
//  Created by Muneeb Ali on 30/09/2024.
//  Copyright © 2024 Muneeb Ali. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var tableData = ["Default Map", "Annotation"]
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = tableData[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var destinationVC = UIViewController()
        
        switch indexPath.row {
        case 0:
            destinationVC = storyboard.instantiateViewController(withIdentifier: "DefaultMapViewController") as! DefaultMapViewController
            break
            
        case 1:
            destinationVC = storyboard.instantiateViewController(withIdentifier: "AnnotationViewController") as! AnnotationViewController
            break
            
        default:
            break
        }
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
