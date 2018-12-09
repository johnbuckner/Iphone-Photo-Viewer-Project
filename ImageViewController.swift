//
//  ImageViewController.swift
//  Photo Viewer Project
//
//  Created by Student on 5/5/17.
//  Copyright © 2017 John Buckner. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    
    
    @IBOutlet weak var myImage: UIImageView!
    var myImageFile: String?
    let fullSize = "http://jimharper.me/csc4423/"
    
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                image = UIImage(data: imageData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let url = URL.init(string: fullSize + myImageFile!)
        myImage.downloadedFrom(url: url!)
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            scrollView.contentSize = myImage.frame.size
            scrollView.addSubview(myImage)
            scrollView.minimumZoomScale = 0.01
            scrollView.maximumZoomScale = 4.0
        }
    }
    
    private var image: UIImage? {
        get{
            return myImage.image
        }
        set {
            myImage.image = newValue
            myImage.sizeToFit()
            scrollView?.contentSize = myImage.frame.size
        }
    }

}

extension ImageViewController : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myImage
    }
}
