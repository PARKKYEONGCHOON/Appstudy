//
//  AlertActionConvertible.swift
//  SearchDaumBlog
//
//  Created by 박경춘 on 2023/03/26.
//

import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
