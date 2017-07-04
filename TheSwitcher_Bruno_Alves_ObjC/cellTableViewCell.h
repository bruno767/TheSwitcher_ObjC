//
//  cellTableViewCell.h
//  TheSwitcher_Bruno_Alves_ObjC
//
//  Created by Bruno Augusto Mendes Barreto Alves on 21/02/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UISwitch *plug;

@end
