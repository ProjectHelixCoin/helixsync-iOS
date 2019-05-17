//
//  DSContactsViewController.m
//  DashSync_Example
//
//  Created by Andrew Podkovyrin on 08/03/2019.
//  Copyright © 2019 Dash Core Group. All rights reserved.
//

#import "DSContactsViewController.h"
#import "DSContactTableViewCell.h"
#import "DSContactReceivedTransactionsTableViewController.h"
#import "DSContactSentTransactionsTableViewController.h"
#import "DSContactSendDashViewController.h"

static NSString * const CellId = @"CellId";

@interface DSContactsViewController ()

@end

@implementation DSContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setBlockchainUser:(DSBlockchainUser *)blockchainUser {
    _blockchainUser = blockchainUser;
    
    self.title = blockchainUser.username;
}

- (IBAction)refreshAction:(id)sender {
    [self.refreshControl beginRefreshing];
    __weak typeof(self) weakSelf = self;
    [self.blockchainUser fetchIncomingContactRequests:^(BOOL success) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        [self.blockchainUser fetchOutgoingContactRequests:^(BOOL success) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (!strongSelf) {
                return;
            }
            
            [strongSelf.refreshControl endRefreshing];
        }];
    }];
}

- (NSString *)entityName {
    return @"DSContactEntity";
}

-(NSPredicate*)predicate {
    return [NSPredicate predicateWithFormat:@"ANY friends == %@",self.blockchainUser.ownContact];
}

- (NSArray<NSSortDescriptor *> *)sortDescriptors {
    NSSortDescriptor *usernameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"username" ascending:YES];
    return @[usernameSortDescriptor];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSContactTableViewCell *cell = (DSContactTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ContactCellIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

-(void)configureCell:(DSContactTableViewCell*)cell atIndexPath:(NSIndexPath *)indexPath {
    DSContactEntity * friend = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = friend.username;
}

#pragma mark - Private

- (void)showAlertTitle:(NSString *)title result:(BOOL)result {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:result ? @"✅ success" : @"❌ failure" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath * selectedIndex = self.tableView.indexPathForSelectedRow;
    DSContactEntity * friend = [self.fetchedResultsController objectAtIndexPath:selectedIndex];
    DSContactEntity * me = self.blockchainUser.ownContact;
    DSFriendRequestEntity * meToFriend = [[me.outgoingRequests filteredSetUsingPredicate:[NSPredicate predicateWithFormat:@"destinationContact == %@",friend]] anyObject];
    DSFriendRequestEntity * friendToMe = [[me.incomingRequests filteredSetUsingPredicate:[NSPredicate predicateWithFormat:@"sourceContact == %@",friend]] anyObject];
    if ([segue.identifier isEqualToString:@"ContactTransactionsSegue"]) {
        UITabBarController * tabBarController = segue.destinationViewController;
        tabBarController.title = friend.username;
        for (UIViewController * controller in tabBarController.viewControllers) {
            if ([controller isKindOfClass:[DSContactReceivedTransactionsTableViewController class]]) {
                DSContactReceivedTransactionsTableViewController *receivedTransactionsController = (DSContactReceivedTransactionsTableViewController *)controller;
                receivedTransactionsController.chainManager = self.chainManager;
                receivedTransactionsController.blockchainUser = self.blockchainUser;
                receivedTransactionsController.friendRequest = meToFriend;
            } else if ([controller isKindOfClass:[DSContactSentTransactionsTableViewController class]]) {
                DSContactSentTransactionsTableViewController *sentTransactionsController = (DSContactSentTransactionsTableViewController *)controller;
                sentTransactionsController.chainManager = self.chainManager;
                sentTransactionsController.blockchainUser = self.blockchainUser;
                sentTransactionsController.friendRequest = friendToMe;
            } else if ([controller isKindOfClass:[DSContactSendDashViewController class]]) {
                ((DSContactSendDashViewController*)controller).blockchainUser = self.blockchainUser;
                ((DSContactSendDashViewController*)controller).contact = friend;
            }
        }
    }
}


@end
