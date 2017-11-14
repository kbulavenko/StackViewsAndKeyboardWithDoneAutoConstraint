//
//  ViewController.m
//  SinglTest
//
//  Created by Z on 13.11.17.
//  Copyright © 2017 Z. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
     Receiving Keyboard Notifications
     When the keyboard is shown or hidden, iOS sends out the following notifications to any registered observers:
     UIKeyboardWillShowNotification
     UIKeyboardDidShowNotification
     UIKeyboardWillHideNotification
     UIKeyboardDidHideNotification
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardEvent:) name:UIKeyboardWillShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardEvent:) name:UIKeyboardDidShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardEvent:) name:UIKeyboardWillHideNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardEvent:) name:UIKeyboardDidHideNotification object: nil];
    _argumentOne.delegate = self;
    _argumentTwo.delegate = self;
    // It's add Done Button
    UIToolbar   *ViewForDoneButtonOnKeyboard = [[UIToolbar alloc] init];
    [ViewForDoneButtonOnKeyboard sizeToFit];
    UIBarButtonItem *btnDoneOnKeyboard = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonFromKeyboadClicked:)];
    [ViewForDoneButtonOnKeyboard setItems:[NSArray arrayWithObjects:btnDoneOnKeyboard, nil]];
    _argumentOne.inputAccessoryView = ViewForDoneButtonOnKeyboard;
    _argumentTwo.inputAccessoryView = ViewForDoneButtonOnKeyboard;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)keyboardEvent:(NSNotification *) notification {
    NSLog(@"note = %@", notification.name);
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    NSLog(@"keyboardFrame=  %@", NSStringFromCGRect(keyboardFrame));
    NSLog(@"viewFrame=  %@", NSStringFromCGRect(self.view.frame));
    if( [notification.name isEqualToString: UIKeyboardDidShowNotification]) {
        _bottomConstraint.constant = 4 + keyboardFrame.size.height;
    } else if( [notification.name isEqualToString: UIKeyboardDidHideNotification]) {
        _bottomConstraint.constant = 4 ;
    }
}


// called when 'return' key pressed. return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField  == _argumentOne) {
        [_argumentOne resignFirstResponder];
        return NO;
    } else if (textField == _argumentTwo) {
        [_argumentTwo resignFirstResponder];
        return NO;
    }
    return YES;
}


- (IBAction)doneButtonFromKeyboadClicked:(id)sender {
    NSLog(@"Done Button Clicked");
    // Hide Keyboard by endEditing
    [self.view endEditing:YES];
}


@end
