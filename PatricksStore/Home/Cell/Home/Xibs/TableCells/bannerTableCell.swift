//
//  bannerTableCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 30/12/21.
//

import UIKit

import ImageSlideshow

import Kingfisher

class bannerTableCell: UITableViewCell {
    //MARK: - IB Outlets
    @IBOutlet weak var sliderView: ImageSlideshow!
    
    var bannerModel = [Banner]()
    
    var bannerImageArray = [KingfisherSource]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupSliderImages()
    }
    //MARK: - Model image Setup Slider Model
    func setupSliderImages(){
        self.bannerImageArray.removeAll()
        self.bannerImageArray = bannerModel.map({ (book) -> KingfisherSource in
            let url = URL(string: book.mainImage!.publicUrl!)
            return KingfisherSource(url: url!)
        })
        self.sliderViewSetup()
    }
    //MARK: - Setup Slider View
    func sliderViewSetup(){
        self.sliderView.layer.cornerRadius = 15.0
        self.sliderView.slideshowInterval = 3.0
        self.sliderView.pageIndicator = .none
        self.sliderView.contentScaleMode = UIViewContentMode.scaleAspectFill
        //sliderView.contentScaleMode = UIViewContentMode.redraw
        self.sliderView.setImageInputs(bannerImageArray)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(self.click))
        self.sliderView.addGestureRecognizer(gestureRecognizer)
    }
    //MARK: - Slider View Click Action
    @objc func click() {
        let value = sliderView.currentPage
    }
}
