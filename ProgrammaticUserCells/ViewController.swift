import UIKit

class ViewController: UIViewController {
    
    var users = [User]() {
        didSet {
            tableView.reloadData()
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableViewCell else {return UITableViewCell()}
        let oneUser = users[indexPath.row]
        cell.nameLabel.text = "\(oneUser.name.first) \(oneUser.name.last)"
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {}
