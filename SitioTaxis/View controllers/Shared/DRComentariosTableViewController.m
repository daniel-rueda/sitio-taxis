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
#import "MessageTableViewCell.h"
#import "MBProgressHUD.h"

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
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
                    hud.labelText = @"Obteniendo comentarios";
                }];
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
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
                    }];
                }];
            }else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No tienes cuenta de Twitter configurada" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
                    [alert show];
                    [self.navigationController popViewControllerAnimated:YES];
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
    static NSString *CellIdentifier = @"commentsCell";
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[MessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *tweet = [_comentarios objectAtIndex:indexPath.row];
    [cell setComment:tweet];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *tweet = [_comentarios objectAtIndex:indexPath.row];
    NSString *text = [tweet objectForKey:@"text"];
    CGSize size = [SpeechBubbleView sizeForText:text];
    return size.height + 25;
}

@end
