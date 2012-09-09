//
//  DRComentariosTableViewController.m
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import "DRComentariosTableViewController.h"
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>

@interface DRComentariosTableViewController ()
{
    NSArray *_comentarios;
    TWRequest *_request;
    NSString *_query;
}
@end

@implementation DRComentariosTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Comentarios";
    _query = @"#CMDF2";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    ACAccountStore *store = [[ACAccountStore alloc] init];
    ACAccountType *twitterAccountType = [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [store requestAccessToAccountsWithType:twitterAccountType withCompletionHandler:^(BOOL granted, NSError *error) {
        if (!granted) {
            NSLog(@"User rejected access to the account.");
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }else {
            NSArray *twitterAccounts = [store accountsWithAccountType:twitterAccountType];
            if ([twitterAccounts count] > 0) {
                ACAccount *account = [twitterAccounts objectAtIndex:0];
                NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/search/tweets.json"];
                NSDictionary *params = [NSDictionary dictionaryWithObject:_query forKey:@"q"];
                _request = [[TWRequest alloc] initWithURL:url 
                                               parameters:params
                                            requestMethod:TWRequestMethodGET];
                [_request setAccount:account];
                [_request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    if (responseData) {
                        NSError *jsonError;
                        id tweets = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&jsonError];
                        if (tweets && [tweets isKindOfClass:[NSDictionary class]]) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                _comentarios = [tweets objectForKey:@"statuses"];
                                [self.tableView reloadData];
                            }];
                        }else {
                            NSLog(@"%@", jsonError);
                        }
                    }
                }];
            }
        }
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_comentarios count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"comentarioCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *tweet = [_comentarios objectAtIndex:indexPath.row];
    NSDictionary *user = [tweet objectForKey:@"user"];
    
    cell.textLabel.text = [user objectForKey:@"screen_name"];
    cell.detailTextLabel.text = [tweet objectForKey:@"text"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
