//
//  ViewController.h
//  TheSwitcher_Bruno_Alves_ObjC
//
//  Created by Bruno Augusto Mendes Barreto Alves on 21/02/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"
@interface ViewController : UIViewController

@property Room *room;
@property (weak, nonatomic) IBOutlet UIImageView *lightImg;
@property (weak, nonatomic) IBOutlet UILabel *roomLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

