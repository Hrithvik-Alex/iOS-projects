//
//  IndividualNoteViewController.swift
//  Quick Notes
//
//  Created by Hrithvik  Alex on 2018-07-25.
//  Copyright © 2018 Hrithvik  Alex. All rights reserved.
//

import UIKit
import CoreData

class IndividualNoteViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var noteTitle: UINavigationItem!
    @IBOutlet weak var textView: UITextView!
    
    
    var eachNoteArray = [Note]()
    
    var selectedNoteTopic: NoteTopic? {
        didSet{
            loadNote()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadNote()
        self.textView.delegate = self
        if eachNoteArray.count > 0 {
            textView.text = eachNoteArray[0].text
        } else {
            print("empty")
        }
    }
    
    //MARK: - Delegate Methods
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        saveNoteText()
    }
    //MARK: - Data manipulation
    
    func loadNote(with request : NSFetchRequest<Note> = Note.fetchRequest()){
        let notesPredicate = NSPredicate(format: "parentNote.title MATCHES %@", selectedNoteTopic!.title!)
        request.predicate = notesPredicate
        do {
            eachNoteArray = try context.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func saveNote(){
        do {
           try context.save()
        } catch {
            print(error)
        }
        loadNote()
    }
    
    func saveNoteText(){
        if eachNoteArray.count == 0 {
            let newNote = Note(context: context)
            newNote.text = textView.text!
            newNote.parentNote = self.selectedNoteTopic
            saveNote()
        } else {
            eachNoteArray[0].setValue(textView.text, forKey: "text")
            saveNote()
        }
    }
    
    //MARK: - done button
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
        saveNoteText()
    }
}
