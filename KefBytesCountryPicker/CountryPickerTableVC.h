//
//  CountryPickerTableVC.h
//  CountryPicker
//
//  Created by Franks, Kent on 6/6/16.
//  Copyright © 2016 Franks, Kent. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CountryPickerDelegate <NSObject>

- (void)setCountry:(NSString *)country;

@end


@interface CountryPickerTableVC : UITableViewController

@property (weak, nonatomic) id <CountryPickerDelegate> delegate;

@end
