//
//  ViewController.swift
//  Alpha_take2
//
//  Created by Cory Green on 2/25/15.
//  Copyright (c) 2015 Cory Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ReturnInformationFromSideBarDelegate, UIPopoverPresentationControllerDelegate{
    
    var sidebar:SideBar = SideBar()
    var toggleSideBar:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var addNewTimerButton:UIBarButtonItem = UIBarButtonItem(title: "Add New Timer", style: UIBarButtonItemStyle.Done, target: self, action: "addNewTimer")
        
        self.navigationItem.leftBarButtonItem = addNewTimerButton
        
        
        // creating the sidebar //
        sidebar = SideBar(view: self.view, navBarHeight: self.navigationController!.navigationBar.frame.height)
        
        sidebar.delegate = self
    }
    
    
    
    
    // opens and closes the side bar for setting timer options //
    func addNewTimer(){
        
        // make the side bar come out!
        if(toggleSideBar == false){
            
            sidebar.openSideBar()
            toggleSideBar = true
            self.navigationItem.leftBarButtonItem?.title = "Done"
            
        }else if(toggleSideBar == true){
            
            sidebar.closeSideBar()
            toggleSideBar = false
            self.navigationItem.leftBarButtonItem?.title = "Add New Timer"
            
        }
    }
    
    func returnSelected(row: Int) {

        if(row != 0){

            var newPopUpView:popUpUI = popUpUI()
            newPopUpView.redrawView(self.view, rowSelected:row)
            newPopUpView.moveViewUp()
            
        }
    }
    


}


