//
//  CountryPickerTableVC.m
//  CountryPicker
//
//  Created by Franks, Kent on 6/6/16.
//  Copyright © 2016 Franks, Kent. All rights reserved.
//

#import "CountryPickerTableVC.h"

@interface CountryPickerTableVC ()

@end

@implementation CountryPickerTableVC

NSDictionary *countries;
NSArray *tableSectionHeaders;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hydrateCountriesDict];
}

#pragma mark hydrate elements
-(void)hydrateCountriesDict {
    countries = @{@"A" : @[@"Afghanistan",@"Åland Islands",@"Albania",@"Algeria",@"American Samoa",@"Andorra",@"Angola",@"Anguilla",@"Antarctica",@"Antigua & Barbuda",@"Argentina",@"Armenia",@"Aruba",@"Australia",@"Austria",@"Azerbaijan"],
                  @"B" : @[@"Bahamas",@"Bahrain",@"Bangladesh",@"Barbados",@"Belarus",@"Belgium",@"Belize",@"Benin",@"Bermuda",@"Bhutan",@"Bolivia",@"Bosnia & Herzegovina",@"Botswana",@"Bouvet Island",@"Brazil",@"British Indian Ocean Territory",@"British Virgin Islands",@"Brunei",@"Bulgaria",@"Burkina Faso",@"Burundi"],
                  @"C" : @[@"Cambodia",@"Cameroon",@"Canada",@"Cape Verde",@"Caribbean Netherlands",@"Cayman Islands",@"Central African Republic",@"Chad",@"Chile",@"China",@"Christmas Island",@"Cocos (Keeling) Islands",@"Colombia",@"Comoros",@"Congo - Brazzaville",@"Congo - Kinshasa",@"Cook Islands",@"Costa Rica",@"Côte d’Ivoire",@"Croatia",@"Cuba",@"Curaçao",@"Cyprus",@"Czech Republic"],
                  @"D" : @[@"Denmark",@"Djibouti",@"Dominica",@"Dominican Republic"],
                  @"E" : @[@"Ecuador",@"Egypt",@"El Salvador",@"Equatorial Guinea",@"Eritrea",@"Estonia",@"Ethiopia"],
                  @"F" : @[@"Falkland Islands",@"Faroe Islands",@"Fiji",@"Finland",@"France",@"French Guiana",@"French Polynesia",@"French Southern Territories"],
                  @"G" : @[@"Gabon",@"Gambia",@"Georgia",@"Germany",@"Ghana",@"Gibraltar",@"Greece",@"Greenland",@"Grenada",@"Guadeloupe",@"Guam",@"Guatemala",@"Guernsey",@"Guinea",@"Guinea-Bissau",@"Guyana"],
                  @"H" : @[@"Haiti",@"Heard & McDonald Islands",@"Honduras",@"Hong Kong SAR China",@"Hungary"],
                  @"I" : @[@"Iceland",@"India",@"Indonesia",@"Iran",@"Iraq",@"Ireland",@"Isle of Man",@"Israel",@"Italy"],
                  @"J" : @[@"Jamaica",@"Japan",@"Jersey",@"Jordan"],
                  @"K" : @[@"Kazakhstan",@"Kenya",@"Kiribati",@"Kuwait",@"Kyrgyzstan"],
                  @"L" : @[@"Laos",@"Latvia",@"Lebanon",@"Lesotho",@"Liberia",@"Libya",@"Liechtenstein",@"Lithuania",@"Luxembourg"],
                  @"M" : @[@"Macau SAR China",@"Macedonia",@"Madagascar",@"Malawi",@"Malaysia",@"Maldives",@"Mali",@"Malta",@"Marshall Islands",@"Martinique",@"Mauritania",@"Mauritius",@"Mayotte",@"Mexico",@"Micronesia",@"Moldova",@"Monaco",@"Mongolia",@"Montenegro",@"Montserrat",@"Morocco",@"Mozambique",@"Myanmar (Burma)"],
                  @"N" : @[@"Namibia",@"Nauru",@"Nepal",@"Netherlands",@"New Caledonia",@"New Zealand",@"Nicaragua",@"Niger",@"Nigeria",@"Niue",@"Norfolk Island",@"North Korea",@"Northern Mariana Islands",@"Norway"],
                  @"O" : @[@"Oman"],
                  @"P" : @[@"Pakistan",@"Palau",@"Palestinian Territories",@"Panama",@"Papua New Guinea",@"Paraguay",@"Peru",@"Philippines",@"Pitcairn Islands",@"Poland",@"Portugal",@"Puerto Rico"],
                  @"Q" : @[@"Qatar"],
                  @"R" : @[@"Réunion",@"Romania",@"Russia",@"Rwanda"],
                  @"S" : @[@"Samoa",@"San Marino",@"São Tomé & Príncipe",@"Saudi Arabia",@"Senegal",@"Serbia",@"Seychelles",@"Sierra Leone",@"Singapore",@"Sint Maarten",@"Slovakia",@"Slovenia",@"So. Georgia & So. Sandwich Isl.",@"Solomon Islands",@"Somalia",@"South Africa",@"South Korea",@"South Sudan",@"Spain",@"Sri Lanka",@"St. Barthélemy",@"St. Helena",@"St. Kitts & Nevis",@"St. Lucia",@"St. Martin",@"St. Pierre & Miquelon",@"St. Vincent & Grenadines",@"Sudan",@"Suriname",@"Svalbard & Jan Mayen",@"Swaziland",@"Sweden",@"Switzerland",@"Syria"],
                  @"T" : @[@"Taiwan",@"Tajikistan",@"Tanzania",@"Thailand",@"Timor-Leste",@"Togo",@"Tokelau",@"Tonga",@"Trinidad & Tobago",@"Tunisia",@"Turkey",@"Turkmenistan",@"Turks & Caicos Islands",@"Tuvalu"],
                  @"U" : @[@"U.S. Outlying Islands",@"U.S. Virgin Islands",@"Uganda",@"Ukraine",@"United Arab Emirates",@"United Kingdom",@"United States",@"Uruguay",@"Uzbekistan"],
                  @"V" : @[@"Vanuatu",@"Vatican City",@"Venezuela",@"Vietnam"],
                  @"W" : @[@"Wallis & Futuna",@"Western Sahara"],
                  @"Y" : @[@"Yemen"],
                  @"Z" : @[@"Zambia",@"Zimbabwe"]};
    
    tableSectionHeaders = [[countries allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return tableSectionHeaders.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self getCountriesInSection:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"countryCell" forIndexPath:indexPath];
    cell.textLabel.text = [self getCurrentCountry:indexPath.section withRowNumber:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate setCountry:[self getCurrentCountry:indexPath.section withRowNumber:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return tableSectionHeaders;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [tableSectionHeaders objectAtIndex:section];
}

#pragma mark - Helper Methods

- (NSArray *)getCountriesInSection:(NSInteger)section {
    NSString *headerForCurrentSection = [tableSectionHeaders objectAtIndex:section];
    return [countries objectForKey:headerForCurrentSection];
}

- (NSString *)getCurrentCountry:(NSInteger)section withRowNumber:(NSInteger)row {
    return [[self getCountriesInSection:section] objectAtIndex:row];
}

@end
