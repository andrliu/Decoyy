//
//  ViewController.m
//  Decoyy
//
//  Created by Andrew Liu on 1/8/15.
//  Copyright (c) 2015 Andrew Liu. All rights reserved.
//

#import "RootViewController.h"
#import "CustomCollectionViewCell.h"
#import "ImageViewController.h"
#import "UploadViewController.h"
#import "Product.h"
#import "User.h"
@import CoreLocation;

@interface RootViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray *arrayOfProducts;
@property NSArray *arrayOfUsers;
@property Product *product1;
@property Product *product2;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.product1 = [[Product alloc]initWithName:@"SOUVLA" withAddress:@"517 Hayes Street, San Francisco, CA 94102" withImage:[UIImage imageNamed:@"souvla"]];
    self.product2 = [[Product alloc]initWithName:@"MARLA BAKERY" withAddress:@"3619 Balboa Street, San Francisco, CA 94121" withImage:[UIImage imageNamed:@"marlabakery"]];
    self.arrayOfProducts = [@[self.product1, self.product2] mutableCopy];
    User *a = [[User alloc]initWithName:@"A"];
    User *b = [[User alloc]initWithName:@"B"];
    self.arrayOfUsers = @[a, b];
    [self sortProductWithUser:a];
}

- (void)sortProductWithUser:(User *)user
{
    self.product1.distance = [self.product1.location distanceFromLocation:user.location];
    self.product2.distance = [self.product2.location distanceFromLocation:user.location];
    self.arrayOfProducts = [[self.arrayOfProducts sortedArrayUsingComparator:^NSComparisonResult(Product *obj1, Product *obj2)
                             {
                                 if (obj1.distance < obj2.distance)
                                 {
                                     return (NSComparisonResult)NSOrderedAscending;
                                 }
                                 if (obj1.distance > obj2.distance)
                                 {
                                     return (NSComparisonResult)NSOrderedDescending;
                                 }
                                 return (NSComparisonResult)NSOrderedSame;
                             }] mutableCopy];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrayOfProducts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Product *product = self.arrayOfProducts[indexPath.item];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%d meters)",product.name, product.distance];
//    cell.detailTextLabel.text = product.address;
    self.navigationItem.title = product.name;
    cell.imageView.image = product.image;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Product *product = self.arrayOfProducts[indexPath.item];
    [self performSegueWithIdentifier:@"Product" sender:product];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:[NSString stringWithFormat:@"Product"]])
    {
        ImageViewController *ivc = segue.destinationViewController;
        ivc.product = sender;
    }
    else
    {
        UploadViewController *uvc = segue.destinationViewController;
        uvc.array = self.arrayOfProducts;
    }
}
- (IBAction)sortByUserA:(UIButton *)sender
{
    [self sortProductWithUser:self.arrayOfUsers[0]];
    [self.collectionView reloadData];
}

- (IBAction)sortByUserB:(UIButton *)sender
{
    [self sortProductWithUser:self.arrayOfUsers[1]];
    [self.collectionView reloadData];
}

@end
