//
//  ColorsNavViewController.swift
//  Colors with Navigation
//
//  Created by Ryan Stephens on 4/1/19.
//  Copyright © 2019 Ryan Stephens. All rights reserved.
//

import UIKit

class ColorsNavViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //@IBOutlet weak var colorsNavTableView: UITableView!
    //var Colors = ["red","orange","yellow","green","blue","purple","brown"]
    var Colors = [Color(name: "red", uiColor: UIColor.red),Color(name: "orange", uiColor: UIColor.orange),Color(name: "yellow", uiColor: UIColor.yellow),Color(name: "green", uiColor: UIColor.green),Color(name: "blue", uiColor: UIColor.blue),Color(name: "purple", uiColor: UIColor.purple),Color(name: "brown", uiColor: UIColor.brown)]
    
    @IBOutlet weak var colorsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // colorsNavTableView.dataSource = self
        //colorsNavTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Colors.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        
        //let color = Colors[indexPath.row]
        
        cell.textLabel?.text = Colors[indexPath.row].name
        cell.backgroundColor = Colors[indexPath.row].uiColor
        
        //cell.backgroundColor = UIColor.green
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        if let destination = segue.destination as? ColorDetai_ViewController
        , let row = colorsTableView.indexPathForSelectedRow?.row 
        {
            destination.color = Colors[row]
        }
        
    }
}


