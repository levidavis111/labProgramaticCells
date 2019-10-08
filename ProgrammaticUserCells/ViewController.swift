import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "userCell")
        
        
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setConstraints()
        setDelegates()
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
    
    private func setDelegates() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension ViewController: UITableViewDelegate {}
