//
//  Room.h
//  TheSwitcher_Bruno_Alves_ObjC
//
//  Created by Bruno Augusto Mendes Barreto Alves on 21/02/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Room : NSObject

@property (nonatomic, assign) BOOL plug;
@property NSString *name;
@property UIImage *img;
@property NSMutableArray *lights;

- (id)init;
- (id)initWithName:(NSString*)name;

- (void)switched;
- (NSString*)status;
- (NSString*)toString;

@end
