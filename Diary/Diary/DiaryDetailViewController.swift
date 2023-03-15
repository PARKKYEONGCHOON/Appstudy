//
//  DiaryDetailViewController.swift
//  Diary
//
//  Created by 박경춘 on 2023/03/15.
//

import UIKit

protocol DiaryDetailViewDelegate: AnyObject {
    func didSelectDelegate(indexPath: IndexPath)
    func didSelectStar(indexPath: IndexPath, isStar: Bool)
}



class DiaryDetailViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentsTextView: UITextView!
    @IBOutlet var dateLabel: UILabel!
    
    var statButton: UIBarButtonItem?
    
    var delegate: DiaryDetailViewDelegate?
    
    var diary: Diary?
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
    }
    
    private func configureView() {
        guard let diary = self.diary else { return }
        self.titleLabel.text = diary.title
        self.contentsTextView.text = diary.contents
        self.dateLabel.text = self.dataToString(date: diary.date)
        self.statButton = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(tabStatButton))
        self.statButton?.image = diary.isStar ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        self.statButton?.tintColor = .orange
        self.navigationItem.rightBarButtonItem = self.statButton
    }
    
    @IBAction func tabEditButton(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "WirteDiaryViewController") as? WirteDiaryViewController else { return }
        guard let indexPath = self.indexPath else { return }
        guard let diary = self.diary else { return }
        vc.diaryEditorMode = .edit(indexPath, diary)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(editDiaryNotification(_:)),
            name: NSNotification.Name("editDiary"),
            object: nil
        )
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tabDeleteButton(_ sender: UIButton) {
        
        guard let indexPath = self.indexPath else { return }
        self.delegate?.didSelectDelegate(indexPath: indexPath)
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    private func dataToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        
        return formatter.string(from: date)
    }
    
    @objc func editDiaryNotification(_ notification: Notification){
        guard let diary = notification.object as? Diary else { return }
        guard let row = notification.userInfo?["indexPath.row"] as? Int else { return }
        self.diary = diary
        self.configureView()
    }
    
    @objc func tabStatButton(){
        guard let isStar = self.diary?.isStar else { return }
        guard let indexPath = self.indexPath else { return }
        
        
        
        if isStar {
            self.statButton?.image = UIImage(systemName: "star")
        }
        else{
            self.statButton?.image = UIImage(systemName: "star.fill")
        }
        self.diary?.isStar = !isStar
        self.delegate?.didSelectStar(indexPath: indexPath, isStar: self.diary?.isStar ?? false)
            
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
