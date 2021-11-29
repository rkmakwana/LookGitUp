//
//  Constants.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/28/21.
//

import Foundation
import UIKit

public enum AppConstants {
    static let title = "Search GitHub"
    static let globalDateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    static let defaultDateFormat = "MMM dd, yyyy"
    static let apiKey = "5fdd254481bf4a2d94392b3ff3c30f88"
}

public enum Endpoints {
    static let fetchResults = "https://api.github.com/search/repositories"
}

public enum ImageNames {
    static let selectedCheckMark = "selected"
    static let unselectedCheckMark = "unselected"
    static let lookingup = "lookingup"
    static let githubIcon = "githubIcon"
    static let star = "star"
    static let like = "like"
    static let liked = "liked"
    static let dislike = "dislike"
    static let disliked = "disliked"
}

public enum AppFonts {
    static let cellTitleLbl = UIFont(name: "HelveticaNeue-Bold", size: 15.0)!
    static let cellSubtitleLbl = UIFont(name: "HelveticaNeue-Medium", size: 14.0)!
    static let cellSecondaryLbl = UIFont(name: "HelveticaNeue-Thin", size: 16.0)!
    static let largeTitleLbl = UIFont(name: "HelveticaNeue-Bold", size: 18.0)!
    static let italicLbl = UIFont(name: "HelveticaNeue-LightItalic", size: 16.0)!
}

public enum ErrorMessages {
    static let searchFailed = "Unable to fetch search results"
}
