//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by wedieu cole on 2021-01-05.
//  Copyright © 2021 Wedieu Cole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    //Intarna Repesenterar varje knapp i spelet
    
     var gameisActive = true
    
    @IBOutlet weak var label: UILabel!
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] // Kombinationer som avgör vinnaren,
    
    
      
    
   
    @IBAction func Action(_ sender: AnyObject) {
       
        
        
        
        if (gameState[sender.tag-1] == 0 && gameisActive == true ){
            // Kollar ifall gamestate rutan är 0 och gameisActive är true
                   
            gameState[sender.tag-1] = activePlayer
            // När man tycker på en rutan så ändras det till activeplayer som bara kan bli 1 eller 2
            
            if (activePlayer == 1) {
                
                
                       
                       (sender as AnyObject).setBackgroundImage(UIImage(named:"cross"),for: UIControl.State())
                       
                       activePlayer = 2
                   }
                   
                   else   {
                        (sender as AnyObject).setBackgroundImage(UIImage(named:"zero"),for: UIControl.State())
                       
                       activePlayer = 1
                       
                   }
               }
        
        // Kollar upp varje arrays från kombnationerna ifall nåt av det passar om det gör så har vi en vinnare
        for combination in winningCombinations {
            if gameState [combination[0]] != 0 && gameState [combination[0]] == gameState [combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                gameisActive = false
                
                if gameState [combination[0]] == 1{
                    // Player 1  cross has won
                    print("Cross has won");
                    label.text = "CROSS HAS WON!"
                }
                else
                {
                    // Player 2 zero has won
                    print("Zero has won");
                    label.text = "NOUGHT HAS WON!"
                }
                playAgainBtn.isHidden = false 
                label.isHidden = false
                
            }
        }
       
        gameisActive = false
         // Ifall alla rutor i klickade så är det inte tillgängligt att fortsätta spela
        
        for i in gameState{
            if i == 0{
                gameisActive = true
                break
                // Här kollar ifall det finns 0or kvar ifall det finns så är spelet fortfarnade igång  och avbryter loopen
            }
        }
        // Om inte det finns nånting kvar och kombiantionera inte har matchas då är det en draw
        
        if gameisActive == false{
            label.text = "IT WAS A DRAW"
            label.isHidden = false
            playAgainBtn.isHidden = false
        }
        
        }
       
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        // När vi tycker på knappen så återställs allt och börjar från början
       gameState = [0,0,0,0,0,0,0,0,0]
        gameisActive = true
        activePlayer = 1
        
        playAgainBtn.isHidden = true
        label.isHidden = true
        
         // Går igenom varje tag som vi satte som motsvara i rutorna alla 9 och ändrar viewen till en button och nollstallerar png på cross och zero
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setBackgroundImage (nil,for: .normal)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

