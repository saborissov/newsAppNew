//
//  OneNewsViewController.swift
//  NewsApp
//
//  Created by SergeyBorisov on 05.04.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class OneNewsViewController: UIViewController {
    
    var article: Article!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var labelPublishedAt: UILabel!
    
    @IBAction func pushOpenAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTitle.text = article.title
        labelDescription.text = article.description
        labelPublishedAt.text = article.publishedAt
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage){
                if let  data = try? Data(contentsOf: url){
                     self.imageView.image = UIImage(data:data)
                }
               
                
            
        }
       
    
    }

}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
