//
//  RatingControl.swift
//  TableViewApp
//
//  Created by Andrew Cheberyako on 06.03.2021.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

    var rating = 0 {
        didSet {
            updateButtonSelectionState()
        }
    }
    private var reatingButtons = [UIButton]()
   
    var starSize:CGSize = CGSize(width: 44, height: 44) {
        didSet {
            setupButton()
        }
    }
    
    
    var starCount:Int = 5 {
        didSet {
            setupButton()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    // активация кнопки
    
    @objc func  ratignButtonTapped(button: UIButton) {
        guard let index = reatingButtons.firstIndex(of: button) else {return}
        
        // рейтинг в зависимости от звезды
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    // приватный метод
    private func setupButton() {
        
        for button in reatingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        //  заполняем звезды
        let filledStar = #imageLiteral(resourceName: "filledStar")
        let emptyStar = #imageLiteral(resourceName: "emptyStar")
        let highlightedStar = #imageLiteral(resourceName: "highlightedStar")
        
        
        
        for _ in 0..<starCount {
        
        let button = UIButton()
       
        // настройка кнопки подстановка избражения
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [ .highlighted, .selected])
        
        // добаляем констрейты
        
        button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
        //  вызваем метод кнопки
        button.addTarget(self, action: #selector(ratignButtonTapped(button:)), for: .touchUpInside)
        // добовляем кнопку в stack
        addArrangedSubview(button)
            reatingButtons.append(button)
        }
        updateButtonSelectionState()
    }
    private func updateButtonSelectionState() {
        for (index, button) in reatingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
    
}
