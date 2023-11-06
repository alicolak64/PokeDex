//
//  AppIcons.swift
//  PokeDex
//
//  Created by Ali Çolak on 6.11.2023.
//

import UIKit

struct AppIcons {
    static let searchBarClearIcon =  UIImage(named: "close")?.withTintColor(AppColors.appRedColor!, renderingMode: .alwaysOriginal)
    static let searchBarSearchIcon =  UIImage(named: "search")?.withTintColor(AppColors.appRedColor!, renderingMode: .alwaysOriginal)
    static let numberSortIcon =  UIImage(named: "id_sort_icon")?.withTintColor(AppColors.appRedColor!, renderingMode: .alwaysOriginal)
    static let nameSortIcon =  UIImage(named: "name_sort_icon")?.withTintColor(AppColors.appRedColor!, renderingMode: .alwaysOriginal)
    static let appLogoSmall = UIImage(named: "pokeballSmall")?.withTintColor(AppColors.whiteColor!, renderingMode: .alwaysOriginal)
    static let appLogoLarge = UIImage(named: "pokeballLarge")
    static let radioButtonCheched = UIImage(named: "radio_button_checked")
    static let radioButtonUncheched = UIImage(named: "radio_button_unchecked")
    static let weightIcon = UIImage(named: "weight")
    static let heightIcon = UIImage(named: "straighten")
}


