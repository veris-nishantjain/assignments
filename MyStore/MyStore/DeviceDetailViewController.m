//
//  DeviceDetailViewController.m
//  MyStore
//
//  Created by Vaibhav Jain on 31/08/16.
//  Copyright © 2016 teramatrix. All rights reserved.
//

#import "DeviceDetailViewController.h"
#import <CoreData/CoreData.h>

@interface DeviceDetailViewController ()

@end

@implementation DeviceDetailViewController



UITextField *name;
UITextField *version;
UITextField *company;


UIButton *cancel;
UIButton *save;






- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}




-(IBAction) Cancel
{
    [self.navigationController popViewControllerAnimated:YES];
   // [self dismissViewController Animated:YES completion:nil];
}


-(IBAction) Save
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
    [newDevice setValue:name.text forKey:@"name"];
    [newDevice setValue:version.text forKey:@"version"];
    [newDevice setValue:company.text forKey:@"company"];
    
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    // its code to create navigation bar
    
    
//    UINavigationBar *myNav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
//    [UINavigationBar appearance].barTintColor = [UIColor lightGrayColor];
//    [self.view addSubview:myNav];
//    
    
    
    
//    cancel = [UIButton buttonWithType: UIButtonTypeRoundedRect];
//    //cancel.frame = CGRectMake(250, self.view.bounds.size.height/2+100 , 80, 50);
//    [cancel setTitle: @"Next" forState: UIControlStateNormal];
//    [cancel addTarget: self action: @selector(Cancel) forControlEvents:UIControlEventTouchUpInside];
//    [cancel setBackgroundColor: [UIColor lightGrayColor]];
//    cancel.layer.cornerRadius = 10;
//    cancel.clipsToBounds = YES;
//    
//    
//    save = [UIButton buttonWithType: UIButtonTypeRoundedRect];
//    //save.frame = CGRectMake(250, self.view.bounds.size.height/2+100 , 80, 50);
//    [save setTitle: @"Next" forState: UIControlStateNormal];
//    [save addTarget: self action: @selector(Save) forControlEvents:UIControlEventTouchUpInside];
//    [save setBackgroundColor: [UIColor blueColor]];
//    save.layer.cornerRadius = 10;
//    save.clipsToBounds = YES;
//    
//    
//    UIBarButtonItem * cancelItem = [[UIBarButtonItem alloc] initWithCustomView:cancel];
//    
//    UIBarButtonItem * saveItem = [[UIBarButtonItem alloc] initWithCustomView:save];
    
    
    
    //its code for adding navogation item
    
//    
//    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:@"Detail"];
//    navigItem.rightBarButtonItem = saveItem;
//    navigItem.leftBarButtonItem = cancelItem;
//    
//    myNav.items = [NSArray arrayWithObjects: navigItem,nil];
//    
//    [UIBarButtonItem appearance].tintColor = [UIColor blueColor];
    
    
    
    name = [ [UITextField alloc] initWithFrame: CGRectMake( 25, 100,self.view.bounds.size.width-2*25 ,50)];
    name.borderStyle= UITextBorderStyleRoundedRect;
    name.layer.borderColor = [[UIColor blueColor] CGColor];
    name.backgroundColor = [ UIColor brownColor];
    name.placeholder = @"Name";
    [name setEnabled:YES];
    [self.view addSubview:name];
    
    
    version = [ [UITextField alloc] initWithFrame: CGRectMake( 25, 200,self.view.bounds.size.width-2*25 ,50)];
    version.borderStyle= UITextBorderStyleRoundedRect;
    version.layer.borderColor = [[UIColor blueColor] CGColor];
    version.backgroundColor = [ UIColor brownColor];
    version.placeholder = @"Version";
    [version setEnabled:YES];
    [self.view addSubview:version];
    
    
    
    company = [ [UITextField alloc] initWithFrame: CGRectMake( 25, 300,self.view.bounds.size.width-2*25 ,50)];
    company.borderStyle= UITextBorderStyleRoundedRect;
    company.layer.borderColor = [[UIColor blueColor] CGColor];
    company.backgroundColor = [ UIColor brownColor];
    company.placeholder=@"Placeholder";
    [company setEnabled:YES];
    [self.view addSubview:company];

    
    
    
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain
                                                                 target:self action:@selector(Cancel)];
    
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain
                                                                 target:self action:@selector(Save)];
    
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationItem setRightBarButtonItem:cancelItem];
    [self.navigationItem setLeftBarButtonItem:saveItem];
    [self.navigationItem setTitle: @"Devices"];
   
    
   
    
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
