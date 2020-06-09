//
//  profimeImgMenager.swift
//  App
//
//  Created by Joao Flores on 27/04/20.
//  Copyright © 2020 Joao Flores. All rights reserved.
//

import UIKit

/// Functions to menage data with profile (image, goals, name, resume)

class ProfileDataMenager {
    var defaults = UserDefaults.standard
    
//    MARK: - Profile Labels / UserDefaults
    func setupNameProfile(nameUser: UILabel) {
        var vet = UIDevice.current.name.split(separator: " ")
        for _ in 0...1 {
            vet.remove(at: 0)
        }
        
        nameUser.text = vet.joined(separator: " ").capitalized
    }
    
    func setupHeaderInformations(goalsTextView: UITextView,currentWeightLabel: UILabel) {
        goalsTextView.text = defaults.string(forKey: "Plain") ?? "Insira seu plano aqui"
        currentWeightLabel.text = "\(defaults.string(forKey: "Weight") ?? "00") Kg"
    }
    
    func setupResumeView(exercicePercentLabel: UILabel, fruitsPercentLabel: UILabel,waterPercentLabel: UILabel) {
        exercicePercentLabel.text = defaults.string(forKey: "exercicePercent") ?? "00 %"
        fruitsPercentLabel.text = defaults.string(forKey: "fruitsPercent") ?? "00 %"
        waterPercentLabel.text = defaults.string(forKey: "waterPercent") ?? "00 %"
    }
    
//    MARK: - Profile Image
    
//    Load
    func setupImgProfile(profileImg: UIImageView) {
        if let image = getSavedImage(named: "ProfileImg") {
            profileImg.image = ImageFunctions().resizeImage(image: image, targetSize: CGSize(width: 512, height: 512))
            
        }
    }
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
//    Save
    func saveImage(image: UIImage) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("ProfileImg.png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}


