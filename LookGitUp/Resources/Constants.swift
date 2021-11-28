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
    static let fetchNews = "http://newsapi.org/v2/top-headlines?country=in"
}

public enum ImageNames {
    static let selectedCheckMark = "selected"
    static let unselectedCheckMark = "unselected"
    static let lookingup = "lookingup"
    static let githubIcon = "githubIcon"
}

public enum AppFonts {
    static let cellTitleLbl = UIFont(name: "HelveticaNeue-Medium", size: 15.0)!
    static let cellSubtitleLbl = UIFont(name: "HelveticaNeue-Thin", size: 13.0)!
    static let largeTitleLbl = UIFont(name: "HelveticaNeue-Bold", size: 18.0)!
    static let descriptionLbl = UIFont(name: "HelveticaNeue", size: 13.0)!
}
