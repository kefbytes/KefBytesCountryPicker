//
//  ViewController.m
//  CountryPicker
//
//  Created by Franks, Kent on 6/6/16.
//  Copyright © 2016 Franks, Kent. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - CountryPickerDelegate
- (void)setCountry:(NSString *)country {
    self.countryLabel.text = country;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CountryPickerSegue"]) {
        CountryPickerTableVC *countryPickerTVC = [segue destinationViewController];
        countryPickerTVC.delegate = self;
    }
}

@end
