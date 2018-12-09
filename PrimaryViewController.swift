//
//  PrimaryViewController.swift
//  Photo Viewer Project
//
//  Created by Student on 5/5/17.
//  Copyright © 2017 John Buckner. All rights reserved.
//

import UIKit

class PrimaryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, SettingsDelegate {


    @IBOutlet weak var myCollectionView: UICollectionView!

    let reuseIdentifier = "cell"
    let myImages = ImageURLs()
    let thumbNails = "http://jimharper.me/csc4423/thumbs/"
    
    private var appSettings = Settings()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Settings"
        {
            if let destination = segue.destination as? SettingsViewController {
                destination.appSettings = self.appSettings
                destination.delegate = self
            }
        }
        else if segue.identifier == "Image" {
            if let destination = segue.destination as? ImageViewController {
                let cell = sender as! ThumbViewCell
                let indexPath = self.myCollectionView.indexPath(for: cell)
                destination.myImageFile = myImages.mySet(photoSettings: appSettings)[(indexPath?.item)!]
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myCollectionView.reloadData()
    }
 
    
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // Remember, you must define the collection view's datasource and delegate.  At a minimum, the following functions
    // must be implemented.
    
    // Tell the collection veiw how many cells to have
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myImages.mySet(photoSettings: appSettings).count
    }
    
    // Make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ThumbViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        let url = URL.init(string: thumbNails + myImages.mySet(photoSettings: appSettings)[indexPath.item])
        cell.myImageView.downloadedFrom(url: url!)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle tap events
    }

    
    // MARK: - Delegate Methods conforming to the protocol SettingsDelegate
    func updateSettings(controller: AnyObject, newSettings: Settings) {
        self.appSettings = newSettings
    }
 
}



extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
