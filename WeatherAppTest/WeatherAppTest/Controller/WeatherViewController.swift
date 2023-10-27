//
//  ViewController.swift
//  WeatherTest
//
//  Created by Dharmesh Kochar on 26/10/23.
//

import UIKit

class WeatherViewController: UIViewController {
    
    enum WeatherSectionType {
        case hourlyStatus
        case weeklyStatus
        case todaysDetail
        case todaysBanner
        
        var headerTitle: String {
            switch self {
            case .hourlyStatus,.weeklyStatus,.todaysBanner: ""
            case .todaysDetail: "Weather details"
            }
        }
    }
    var dataSource: [WeatherSectionType] = [.hourlyStatus,.weeklyStatus,.todaysDetail,.todaysBanner]
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBarView: UIView!
    
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
}

  //MARK: - Extension for private function
private extension WeatherViewController {
    func initialSetup() {
        setUpTableView()
    }
    
    func setUpTableView() {
        tableView.registerCell(with: TodayBannerCell.self)
        tableView.registerCell(with: DayReportCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - Extension for tableview
extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSource[indexPath.row] {
        case .hourlyStatus:
            let cell = tableView.dequeueCell(with: TodayBannerCell.self, indexPath: indexPath)
            return cell
        case .weeklyStatus:
            let cell = tableView.dequeueCell(with: DayReportCell.self, indexPath: indexPath)
            return cell
        case .todaysDetail:
            let cell = tableView.dequeueCell(with: TodayBannerCell.self, indexPath: indexPath)
            return cell
        case .todaysBanner:
            let cell = tableView.dequeueCell(with: TodayBannerCell.self, indexPath: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        184
    }
    
}

