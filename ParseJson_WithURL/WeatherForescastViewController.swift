//
//  ViewController.swift
//  ParseJson_WithURL
//
//  Created by Felipe Ignacio Zapata Riffo on 22-07-21.
//

import UIKit



class WeatherForescastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView:UITableView!
    var results: WeatherForecast?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0"
        getData(url: url)
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "WeatherForescastViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WeatherForescastViewCell")
        self.title = "WeatherForescast Example"
        tableView.rowHeight = 200
        tableView.reloadData()
      

    }
    
    //DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return results?.dataseries.count ?? 0
 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForescastViewCell", for: indexPath) as! WeatherForescastViewCell
    
        if let timePoint = results?.dataseries[indexPath.row].timepoint{
        cell.timepointLabel.text = "\(timePoint)"
        }
        if let cloud = results?.dataseries[indexPath.row].cloudcover {
            cell.cloudcoverLabel.text = "\(cloud)"
           
        }
        if let seeing = results?.dataseries[indexPath.row].seeing{
            cell.seeingLabel.text = "\(seeing)"
        }
        if let transparency = results?.dataseries[indexPath.row].transparency{
            cell.transparencyLabel.text = "\(transparency)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
         
    }
    
    
    // Data Json
    private func getData(url:String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in 
            guard let data = data, error == nil else {
                print("some error here")
                return
            }
            //have data
            do {
                self.results = try! JSONDecoder().decode(WeatherForecast.self, from: data)
                if let data = self.results{
                    print(data.dataseries)
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
               
            }
            catch {
                print("error to convert json")
            }
            guard let json = self.results else {
                return
                
                
            }
   
            
        })
        task.resume()
        
    }
}

