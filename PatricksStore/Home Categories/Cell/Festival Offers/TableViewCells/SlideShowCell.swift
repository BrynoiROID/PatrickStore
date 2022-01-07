//
//  SlideShowCell.swift
//  PatricksStore
//
//  Created by Admin on 09/09/21.
//

import UIKit

import ImageSlideshow

class SlideShowCell: UITableViewCell, ImageSlideshowDelegate {
    
    //MARK: - IB Outlets
    @IBOutlet weak var imgSlideshow: ImageSlideshow!
    
    @IBOutlet weak var imgPageCounter: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sliderViewSetup()
        imgCounterSetup()
    }

    //MARK: - Slider View Setup
    func sliderViewSetup() {
        imgSlideshow.delegate = self
        imgSlideshow.layer.cornerRadius = 15.0
        imgSlideshow.slideshowInterval = 5.0
        imgSlideshow.pageIndicator = .none
        imgSlideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        imgSlideshow.setImageInputs([
          ImageSource(image: UIImage(named: "slider-image")!),
          ImageSource(image: UIImage(named: "slider-image")!),
          ImageSource(image: UIImage(named: "slider-image")!),
          ImageSource(image: UIImage(named: "slider-image")!)
        ])
        
    }
    
    //MARK: - Image Counter Setup
    func imgCounterSetup() {
        imgPageCounter.numberOfPages = 4
    }
    
    //MARK: - Get Current Page Index
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        imgPageCounter.currentPage = page
    }

}
