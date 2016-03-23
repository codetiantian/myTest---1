//
//  CBSecondViewController.h
//  CBLern
//
//  Created by Elaine on 15--9.
//  Copyright © 2015年 yinuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBThing.h"

@interface CBSecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@property (strong, nonatomic) CBThing *thing;

@end
