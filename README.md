# TwoSetTableView

Tableview from 2 sets of data. From this [question](https://stackoverflow.com/q/65816833/14351818) on Stack Overflow.

```swift
class ViewController: UIViewController {

    var myFirstData = ["Hello", "Hi"]
    var mySecondData = ["Goodbye", "Bye"]
    var combinedData = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        combinedData = myFirstData + mySecondData /// set combinedData (will not affect myFirstData or mySecondData)
        tableView.dataSource = self
        tableView.delegate = self
    }
}
```

<kbd>![](https://raw.githubusercontent.com/aheze/DeveloperAssets/master/TwoSetTableViewRec.gif)</kbd>
