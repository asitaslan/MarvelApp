//
//  DetailViewController.swift
//  MarvelApp
//
//  Created by Asit Aslan on 2.02.2022.
//  Copyright © 2022 Asit Aslan. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewViewController {

    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var comicsLbl: UILabel!
    private var id = 0
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var detail: Detail?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData(){
        spinner.startAnimating()
        serviceController.getCharactersDetail(id: id) { result in
            self.spinner.stopAnimating()
            self.detail = result
            self.setData()
        } fail: { error in
            self.spinner.stopAnimating()
            self.showError(error: error)
        }
    }
    
    private func setData(){
        guard let charactersData = detail?.data?.results?.first else { return }
        self.navigationItem.title = charactersData.name
        nameLbl.text = charactersData.name
        characterImageView.downloadImage(from: charactersData.thumbnail?.path ?? "")
        descriptionLbl.text = charactersData.resultDescription
        var comicsText = ""
        charactersData.comics?.items?.forEach({ item in
            if comicsText != "" {
                comicsText = comicsText + "\n" + (item.name ?? "")
            }else {
                comicsText = item.name ?? ""
            }
        })
        comicsLbl.text = comicsText
    }
    
    
    static func push(from: UIViewController, id: Int) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.id = id
            from.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
