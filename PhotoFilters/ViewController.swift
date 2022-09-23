//
//  ViewController.swift
//  PhotoFilters
//
//  Created by user on 21/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    // Create a place to render the filtered image
    let context = CIContext(options: nil)
    
    @IBAction func applyFilter(sender: AnyObject) {
        // Create an image to filter
        let inputImage = CIImage(image: photoImageView.UIimage)
        
        // Create a random color to pass to a filter
        let randomColor = [kCIInputAngleKey: (Double(arc4random_uniform(314)) / 100)]
        
        // Apply a filter to the image
        let filteredImage = inputImage.applyingFilter("CIHueAdjust", parameters: randomColor)
        
        // Render the filtered image
        let renderedImage = context.createCGImage(filteredImage, from: filteredImage.extent)
        
        // Reflect the change back in the interface
        photoImageView.image = UIImage(cgImage: renderedImage!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

