
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var selectedIndexpath : IndexPath?
    @IBOutlet weak var tableView: UITableView!
    var myData = [MyData]()
    var icons: [String: String] = ["user": "person", "Address": "house", "Card": "creditcard", "Email": "mail", "Phone": "phone", "Vehical": "car", "Assets": "ipad"]
    override func viewDidLoad() {
        super.viewDidLoad()

        myData = [
            MyData(title: "User", options: ["User1", "User2"], selectedOption: "User1"),
            MyData(title: "Address", options: ["Address1","Address2"], selectedOption: "Address1"),
            MyData(title: "Card", options: ["card1"], selectedOption: "card1"),
            MyData(title: "Email", options: ["email"], selectedOption: "email"),
            MyData(title: "Phone", options: ["Phone1", "Phone2", "Phone3"], selectedOption: "Phone1"),
            MyData(title: "Vehical", options: ["car", "Bike"], selectedOption: "Bike"),
            MyData(title: "Assets", options: ["Iphone", "MacBook", "iPad"], selectedOption: "Macbook")
        ]
        
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SectionHeader(frame: CGRect(x: 0, y: 0, width: 100, height: 130))
        let data = myData[section]
        header.title.text = data.title
        header.headerImage.image = UIImage(systemName: icons[data.title] ?? "person")
        header.subTitle.text = "This is to show \(data.title)"
        header.selectedData.text = data.selectedOption
        header.showBtn.addTarget(self, action: #selector(editPressed), for: .touchUpInside)
        header.showBtn.tag = section
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 130
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = myData[section]
        
        if data.isExpanded {
            return data.options.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.cellData.text = myData[indexPath.section].options[indexPath.row]
        cell.celBtn.indexpath = indexPath
        cell.cellData.delegate = self
        cell.celBtn.addTarget(self, action: #selector(editCellPressed(_:)), for: .touchUpInside)
            if selectedIndexpath == indexPath {
                cell.celBtn.isSelected = true
                cell.backgroundColor = .lightGray
                cell.cellData.isUserInteractionEnabled = true
                cell.cellData.becomeFirstResponder()
            } else {
                cell.celBtn.isSelected = false
                cell.backgroundColor = .white
                cell.cellData.isUserInteractionEnabled = false
                print(cell.cellData.text!)
//                cell.cellData.isUserInteractionEnabled = false
//                myData[indexPath.section].options[indexPath.row] = cell.cellData.text ?? ""
            }
//        }
        return cell
    }
    
    @objc func editPressed(_ sender: UIButton) {
        let section = sender.tag
        for i in 0...myData.count-1 {
            
            if i != section {
                myData[i].isExpanded = false
            }
        }
        myData[section].isExpanded = !myData[section].isExpanded
        tableView.reloadData()
    }
    
    @objc func editCellPressed(_ sender: myButton) {
        if !sender.isSelected {
            selectedIndexpath = sender.indexpath
        }
        tableView.reloadRows(at: [sender.indexpath!], with: .none)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let path = selectedIndexpath {
            myData[path.section].options[path.row] = textField.text ?? ""
            selectedIndexpath = nil
        }
    }
}


