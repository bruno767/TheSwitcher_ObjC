//
//  NewViewController.h
//  TheSwitcher_Bruno_Alves_ObjC
//
//  Created by Bruno Augusto Mendes Barreto Alves on 21/02/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddRoom
- (void) newRoomWithName:(NSString*)name AndStatus:(BOOL)status;
@end

@interface NewViewController : UIViewController

@property (weak) id <AddRoom> addRoom;
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UISwitch *statusSwitch;


@end
