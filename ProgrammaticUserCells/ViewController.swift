import UIKit

class ViewController: UIViewController {
    
    var users = [User]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "userCell")
        
        return tableView
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        addSubviews()
        setDelegates()
        setConstraints()
    }
    
    private func loadData() {
        UsersFetchingService.manager.getUsers { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let users):
                DispatchQueue.main.async {
                    self.users = users
                }
                
            }
        }
    }
    
    private func setDelegates() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    private func addSubviews() {
        self.view.addSubview(tableView)
    }
    
    private func setConstraints() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

    }

    

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableViewCell else {return UITableViewCell()}
        let oneUser = users[indexPath.row]
        cell.nameLabel.text = "\(oneUser.name.first) \(oneUser.name.last)"
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        let userDetailVC = UserDetailViewController()
        userDetailVC.oneUser = user
        self.navigationController?.pushViewController(userDetailVC, animated: true)
    }
}

//func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let podcastSelected = podcasts[indexPath.row]
//        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
//        let podcastDetailVC = storyBoard.instantiateViewController(withIdentifier: "PodcastDetailViewController") as! PodcastDetailViewController
//        podcastDetailVC.podcast = podcastSelected
//    self.navigationController?.pushViewController(podcastDetailVC, animated: true)
//    }
//
//}
