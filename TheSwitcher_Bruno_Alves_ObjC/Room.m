//
//  Room.m
//  TheSwitcher_Bruno_Alves_ObjC
//
//  Created by Bruno Augusto Mendes Barreto Alves on 21/02/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

#import "Room.h"

@implementation Room


- (id)init{
    if(self = [super init]) {
        [self initlights];
        self.plug = false;
        self.img = self.lights[1];
        self.name = @"Room";
    }
    return self;
}

- (id)initWithName:(NSString*)name{
    
    if (self = [super init]) {
        [self initlights];
        self.plug = false;
        self.img = self.lights[1];
        self.name = name;
    }
    return self;
}
- (void)initlights{
    self.lights = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"light_image_ON"],[UIImage imageNamed:@"light_image_OFF"], nil];
}

- (void)switched{
    if (self.plug == true) {
        [self setPlug:NO];
        self.img = self.lights[1];
    }else{
        [self setPlug:YES];
        self.img = self.lights[0];
    }

}

- (NSString*)status{
    if (self.plug == true) {
        return @"ON";
    }else{
        return @"OFF";
    }
}
- (NSString*)toString{
    return [NSString stringWithFormat:@"Your  %@ light is", self.name];
}


@end
