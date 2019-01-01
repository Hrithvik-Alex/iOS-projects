//
//  NoteViewController.swift
//  Quick Notes
//
//  Created by Hrithvik  Alex on 2018-07-25.
//  Copyright © 2018 Hrithvik  Alex. All rights reserved.
//

import UIKit
import CoreData

class NoteViewController: UITableViewController {
    var notes = [NoteTopic]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNotes()
        
    }

    //MARK: - DataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        let note = notes[indexPath.row]
        
        cell.textLabel?.text = note.title
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    //MARK: - Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToNote", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! IndividualNoteViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedNoteTopic = notes[indexPath.row]
            destinationVC.noteTitle.title = notes[indexPath.row].title!
        }
    }

    
    //MARK: - Data Manipulation
    
    func saveNotes() {
        do {
            try context.save()
        } catch {
            print(error)
        }
        tableView.reloadData()
    }
    
    func loadNotes(with request: NSFetchRequest<NoteTopic> = NoteTopic.fetchRequest()) {
        
        do {
            notes = try context.fetch(request)
        } catch {
            print(error)
        }
        tableView.reloadData()
    }
    
    

    //MARK: - Add Button Functionality
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Note", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newNoteTopic = NoteTopic(context: self.context)
            newNoteTopic.title = textField.text!
            
            self.notes.append(newNoteTopic)
            self.saveNotes()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Note"
            textField = alertTextField
            
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
