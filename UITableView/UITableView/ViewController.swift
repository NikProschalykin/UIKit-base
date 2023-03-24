import Foundation
import UIKit



class ViewController: UIViewController {

    var contacts = Source.makeContactsWithGroup()
    
    let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    let editButton = UIButton()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "some text"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupButton()
        
        tableView.register(ContactCell.self, forCellReuseIdentifier: "ContactCell")
        
        tableView.dataSource = self // чтобы заносить данные в таблицу
        tableView.delegate = self //чтобы менять что-то в таблице
        
        //tableView.isEditing = true
        //tableView.backgroundView = label
        //tableView.rowHeight = 100
        tableView.estimatedRowHeight = 50
        tableView.separatorStyle = .singleLine
        //tableView.separatorColor = .red
        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.scrollToRow(at: .init(row: 4, section: 1), at: .middle, animated: true)
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Group 1"
        case 1: return "Group 2"
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell else { fatalError() }
        //indexpath - структура, которая содержит номер секции и номер ячейки
        
     //  cell.configure(contact: contacts[indexPath.row])
        
        cell.configure(contact: contacts[indexPath.section][indexPath.row])
        
        return cell
    }
    //удалить ячейку
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        contacts[indexPath.section].remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    
    //перемещение ячеек между собою
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let contact = contacts[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        contacts[destinationIndexPath.section].insert(contact, at: destinationIndexPath.row)
    }
    
}
//если выберется ячейка
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = UIAlertController(
            title: contacts[indexPath.section][indexPath.row].name,
            message: contacts[indexPath.section][indexPath.row].descriprion,
            preferredStyle: .alert
        )
        ac.addAction(.init(title: "ok", style: .default,handler: nil))
        present(ac,animated: true)
    }
}

extension ViewController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
           // tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
    }
}




extension ViewController {
    func setupButton() {
        view.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.setTitleColor(.black, for: .normal)
        editButton.setTitleColor(.gray, for: .highlighted)
        NSLayoutConstraint.activate([
            editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            editButton.topAnchor.constraint(equalTo: tableView.bottomAnchor,constant: 8),
            editButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -16)
        
        ])
        
        //editButton.setTitle("edit", for: .normal)
        editButton.setTitle("edit", for: .normal)
        editButton.addTarget(self, action: #selector(edit(sender:)), for: .touchUpInside)
        
        editButton.layer.cornerRadius = 15
        editButton.layer.borderColor = UIColor.black.cgColor
        editButton.layer.borderWidth = 1
    }
    
    @objc func edit(sender: UIButton) {
//        contacts = Source.makeContactsWithGroup()
//        tableView.reloadData()
        
        tableView.isEditing.toggle()
        editButton.setTitle(tableView.isEditing ? "end edit" : "edit", for: .normal)
    }
}
