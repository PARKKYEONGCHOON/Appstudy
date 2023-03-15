//
//  WirteDiaryViewController.swift
//  Diary
//
//  Created by 박경춘 on 2023/03/15.
//

import UIKit


enum DiaryEditorMode {
    case new
    case edit(IndexPath, Diary)
}

protocol WriteDiaryViewDelegate: AnyObject {
    func didSelectRegister(diary: Diary)
    
}

class WirteDiaryViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var ContentsTextView: UITextView!
    @IBOutlet var DateTextField: UITextField!
    @IBOutlet var ConfirmButton: UIBarButtonItem!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    var delegate: WriteDiaryViewDelegate?
    var diaryEditorMode: DiaryEditorMode = .new
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
        self.configureInputField()
        self.configureEditMode()
        self.ConfirmButton.isEnabled = false
        
    }
    
    private func configureEditMode(){
        switch self.diaryEditorMode {
        case let .edit(_, diary):
            
            self.titleTextField.text = diary.title
            self.ContentsTextView.text = diary.contents
            self.DateTextField.text = self.dataToString(date: diary.date)
            self.diaryDate = diary.date
            self.ConfirmButton.title = "수정"
            
        default:
            break
        }
    }
        
    
    private func configureContentsTextView(){
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        
        self.ContentsTextView.layer.borderColor = borderColor.cgColor
        self.ContentsTextView.layer.borderWidth = 0.5
        self.ContentsTextView.layer.cornerRadius = 5.0
    }
    
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerDidChange(_:)), for: .valueChanged)
        self.datePicker.locale = Locale(identifier: "ko_KR")
        self.DateTextField.inputView = self.datePicker
    }
    
    private func configureInputField(){
        self.ContentsTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        self.DateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
    }

    @IBAction func TabConfirm(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.ContentsTextView.text else { return }
        guard let date = self.diaryDate else { return }
        
        let diary = Diary(title: title, contents: contents, date: date, isStar: false)
        
        switch self.diaryEditorMode {
        case .new:
            self.delegate?.didSelectRegister(diary: diary)
        
        case let .edit(indxPath, _):
            NotificationCenter.default.post(
                name: NSNotification.Name("editDiary"),
                object: diary,
                userInfo: [
                    "indexPath.row": indxPath.row
                ]
                
            )
        
        }

        
        
        self.navigationController?.popViewController(animated: true)
        
       
    }
    
    @objc private func datePickerDidChange(_ datePicker: UIDatePicker){
        let formmater = DateFormatter()
        formmater.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        formmater.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.DateTextField.text = formmater.string(from: datePicker.date)
        self.DateTextField.sendActions(for: .editingChanged)
    }
    
    @objc private func titleTextFieldDidChange(_ textField: UITextField){
        self.validateInputField()
    }
    
    @objc private func dateTextFieldDidChange(_ textField: UITextField){
        self.validateInputField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func validateInputField(){
        self.ConfirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.DateTextField.text?.isEmpty ?? true) && !self.ContentsTextView.text.isEmpty
    }
    
    private func dataToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        
        return formatter.string(from: date)
    }

}

extension WirteDiaryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}
