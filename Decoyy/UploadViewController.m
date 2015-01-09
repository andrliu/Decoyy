//
//  UploadViewController.m
//  Decoyy
//
//  Created by Andrew Liu on 1/8/15.
//  Copyright (c) 2015 Andrew Liu. All rights reserved.
//

#import "UploadViewController.h"
#import "Product.h"

@interface UploadViewController () <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property UIImage *image;

@end

@implementation UploadViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)pick:(UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.image = info[UIImagePickerControllerEditedImage];
    self.imageView.image = self.image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(UIButton *)sender
{
    Product *prodcut = [[Product alloc]initWithName:self.nameTextField.text withAddress:self.addressTextField.text withImage:self.image];
    [self.array addObject:prodcut];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
