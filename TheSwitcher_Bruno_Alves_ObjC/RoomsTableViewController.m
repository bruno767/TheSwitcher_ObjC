//
//  RoomsTableViewController.m
//  TheSwitcher_Bruno_Alves_ObjC
//
//  Created by Bruno Augusto Mendes Barreto Alves on 21/02/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

#import "RoomsTableViewController.h"
#import "Room.h"
#import "cellTableViewCell.h"
#import "ViewController.h"
#import "NewViewController.h"

@interface RoomsTableViewController () 

@end

@implementation RoomsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [[UIColor alloc]initWithRed:115.0/255.0 green:161.0/255.0 blue:81.0/255.0 alpha:1.0];
    
    [[UIApplication sharedApplication].delegate.window setTintColor:[UIColor whiteColor]];
    
    
    Room *r1 = [[Room alloc]initWithName:@"Kitchen"];
    Room *r2 = [[Room alloc]initWithName:@"Living room"];
    Room *r3 = [[Room alloc]initWithName:@"Master bedroom"];
    Room *r4 = [[Room alloc]initWithName:@"Guest’s bedroom"];
    _rooms = [[NSMutableArray alloc]init];
    [self.rooms addObject:r1];
    [self.rooms addObject:r2];
    [self.rooms addObject:r3];
    [self.rooms addObject:r4];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.rooms count];
}

- (IBAction)switched:(UISwitch *)sender {
    Room *r = self.rooms[sender.tag];
    [r switched];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"ShowLight" sender:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *cellTableIdentifier = @"cellRoom";
    cellTableViewCell *cellRoom = [tableView dequeueReusableCellWithIdentifier:@"cellRoom" forIndexPath:indexPath];
    
    if (cellRoom == nil) {
        cellRoom = [[cellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellTableIdentifier];
    }
    Room* rm = (Room*) self.rooms[indexPath.row];
    cellRoom.nameLabel.text = rm.name;
    
    cellRoom.plug.tag = indexPath.row;
    cellRoom.plug.on = rm.plug;
    
    return cellRoom;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_rooms removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
///
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowLight"]) {
        
        ViewController *vc = [segue destinationViewController];

        NSIndexPath *index = (NSIndexPath*)sender;
        
        Room* r = self.rooms[index.row];
        
        [vc setRoom:r];
    }else{
        NewViewController* nvc = [segue destinationViewController];
        nvc.addRoom = self;
        
    }
    
}

- (void)newRoomWithName:(NSString *)name AndStatus:(BOOL)status{
    Room* nr = [[Room alloc]initWithName:name];
    [nr setPlug:status];
    [_rooms addObject:nr];
}

@end
