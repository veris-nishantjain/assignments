//
//  DeviceTableViewController.m
//  MyStore
//
//  Created by Vaibhav Jain on 31/08/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "DeviceTableViewController.h"
#import <CoreData/CoreData.h>
#import "DeviceDetailViewController.h"

@interface DeviceTableViewController ()




@end

@implementation DeviceTableViewController

NSMutableArray *devices;

UIButton *add;


- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Device"];
    devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tableView reloadData];
}



-(IBAction) Add
{
    DeviceDetailViewController *viewController = [DeviceDetailViewController alloc];
    
    [self.navigationController pushViewController: viewController animated:YES];
}






- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];  // it was used to remove error
    
    
//    add = [UIButton buttonWithType: UIButtonTypeRoundedRect];
//    //cancel.frame = CGRectMake(250, self.view.bounds.size.height/2+100 , 80, 50);
//    [add setTitle: @"+" forState: UIControlStateNormal];
//    [add addTarget: self action: @selector(Add) forControlEvents:UIControlEventTouchUpInside];
//    [add setBackgroundColor: [UIColor lightGrayColor]];
//    add.layer.cornerRadius = 10;
//    add.clipsToBounds = YES;
    
    
//    UINavigationBar *myNav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
//    [UINavigationBar appearance].barTintColor = [UIColor lightGrayColor];
//    [self.view addSubview:myNav];
    
//    UIBarButtonItem *addDevice = [[UIBarButtonItem alloc] initWithCustomView:add];
    
    
    
    UIBarButtonItem *addDevice = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(Add)];
    
    
//    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:@"Add Device"];
//    navigItem.rightBarButtonItem = addDevice;
//    myNav.items = [NSArray arrayWithObjects: navigItem,nil];
    
    //[UIBarButtonItem appearance].tintColor = [UIColor blueColor];

    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    [self.navigationItem setTitle: @"Add Device"];
    [self.navigationItem setRightBarButtonItem:addDevice];
    
    //[addDevice release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//  return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// return the number of rows
    return devices.count;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
//                                   reuseIdentifier:CellIdentifier]];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }
    
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleSubtitle
                 reuseIdentifier:CellIdentifier];
    }
    
    
    
    // Configure the cell...
    NSManagedObject *device = [devices objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@   %@", [device valueForKey:@"name"], [device valueForKey:@"version"]]];
     [cell.detailTextLabel setEnabled:YES];
    
    [cell.detailTextLabel setText:[device valueForKey:@"company"]];
   
    return cell;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
