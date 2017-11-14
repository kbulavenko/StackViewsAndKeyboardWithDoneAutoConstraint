//
//  ViewController.h
//  SinglTest
//
//  Created by Z on 13.11.17.
//  Copyright © 2017 Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet UITextField *argumentOne;
@property (weak, nonatomic) IBOutlet UITextField *argumentTwo;


@end

