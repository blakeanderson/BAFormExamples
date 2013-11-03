//
//  BAViewController.m
//  SimpleForm
//
//  Created by Blake on 10/27/13.
//  Copyright (c) 2013 BlakeAnderson. All rights reserved.
//

#import "BAViewController.h"
#import "BATextField.h"

@interface BAViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) BATextField *firstNameTextField;
@property (strong, nonatomic) BATextField *lastNameTextField;
@property (strong, nonatomic) BATextField *emailTextField;
@property (strong, nonatomic) BATextField *passwordTextField;
@property (strong, nonatomic) UIButton *registerButton;

@end


static CGFloat tableTopMargin = 40.0f;

@implementation BAViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]){

	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view addSubview:self.tableView];
	[self.view addSubview:self.registerButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recxreated.
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Accessors
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (UITableView *)tableView {
	if (!_tableView){
		CGFloat tableMargin = (self.view.frame.size.width - [self tableWidth]) / 2;
		CGFloat tableHeight = [self inputCellHeight] * [self tableView:_tableView numberOfRowsInSection:0];
		CGRect tableFrame = CGRectMake(tableMargin, tableTopMargin, [self tableWidth], tableHeight);

		_tableView = [[UITableView alloc] initWithFrame:tableFrame];
		_tableView.backgroundColor = [UIColor whiteColor];
		_tableView.scrollEnabled = NO;
		_tableView.backgroundView = nil;
		_tableView.layer.borderColor = [[UIColor grayColor] CGColor];
		_tableView.layer.borderWidth = 1.0f;
		_tableView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
		_tableView.dataSource = self;
		_tableView.delegate = (id)self;
	}
	
	return _tableView;
}

- (BATextField*)firstNameTextField
{
	if (!_firstNameTextField)
	{
		_firstNameTextField = [[BATextField alloc] initWithFrame:CGRectMake(15.0f, [self textFieldTopMargin], [self textFieldWidth], [self textFieldHeight]) withPlaceholderText:@"First Name"];
		_firstNameTextField.delegate = self;
	}
	return _firstNameTextField;
}

- (BATextField*)lastNameTextField
{
	if (!_lastNameTextField)
	{
		_lastNameTextField = [[BATextField alloc] initWithFrame:CGRectMake(15.0f, [self textFieldTopMargin], [self textFieldWidth], [self textFieldHeight]) withPlaceholderText:@"Last Name"];
		_lastNameTextField.delegate = self;
		
	}
	return _lastNameTextField;
}

- (BATextField*)emailTextField
{
	if (!_emailTextField)
	{
		_emailTextField = [[BATextField alloc] initWithFrame:CGRectMake(15.0f, [self textFieldTopMargin], [self textFieldWidth], [self textFieldHeight]) withPlaceholderText:@"Email"];
		_emailTextField.delegate = self;
	}
	return _emailTextField;
}

- (BATextField*)passwordTextField
{
	if (!_passwordTextField)
	{
		_passwordTextField = [[BATextField alloc] initWithFrame:CGRectMake(15.0f, [self textFieldTopMargin], [self textFieldWidth], [self textFieldHeight]) withPlaceholderText:@"Password"];
		_passwordTextField.delegate = self;
		_passwordTextField.secureTextEntry = YES;
		_passwordTextField.returnKeyType = UIReturnKeyGo;
	}
	return _passwordTextField;
}

- (UIButton*)registerButton
{
	if (!_registerButton)
	{
		_registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
		_registerButton.frame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y + self.tableView.frame.size.height, [self tableWidth], [self inputCellHeight]);
		_registerButton.backgroundColor = [UIColor orangeColor];
		[_registerButton.titleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
		[_registerButton setTitle:@"Register Now!" forState:UIControlStateNormal];
		_registerButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
		[_registerButton setTintColor:[UIColor blackColor]];

		[_registerButton addTarget:self action:@selector(registerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _registerButton;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Measurement Methods
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (CGFloat)inputCellHeight {
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 68.0f : 48.0f;
}

- (CGFloat)textFieldWidth {
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 300.0f : 226.0f;
}

- (CGFloat)textFieldHeight {
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 50.0f : 30.0f;
}

- (CGFloat)textFieldTopMargin {
	return ([self inputCellHeight] - [self textFieldHeight]) / 2;
}

- (CGFloat)tableWidth {
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 360.0f : 256.0f;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDataSource
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

	// We've got 4 text fields
	return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *const cellIdentifier = @"loginInputIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.textLabel.textColor = [UIColor blackColor];
	}
	
	if (indexPath.row == 0) {
		[cell.contentView addSubview:self.firstNameTextField];
	} else if (indexPath.row == 1) {
		[cell.contentView addSubview:self.lastNameTextField];
	} else if (indexPath.row == 2) {
		[cell.contentView addSubview:self.emailTextField];
	} else if (indexPath.row == 3) {
		[cell.contentView addSubview:self.passwordTextField];
	}
	
	return cell;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDelegate
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [self inputCellHeight];
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITextFieldDelegate
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
    if(textField == self.firstNameTextField){
        [self.lastNameTextField becomeFirstResponder];
    } else if (textField == self.lastNameTextField) {
		[self.emailTextField becomeFirstResponder];
	} else if (textField == self.emailTextField) {
		[self.passwordTextField becomeFirstResponder];
	}
    else{
        [textField resignFirstResponder];
        if(textField == self.passwordTextField){
            [self registerButtonTapped:self];
        }
    }
    return NO;
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Actions
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)registerButtonTapped:(id)sender {
	
	NSDictionary *formValues = @{ @"First Name" : self.firstNameTextField.text,
								  @"Last Name" : self.lastNameTextField.text,
								  @"Email" : self.emailTextField.text,
								  @"Password" : self.passwordTextField.text};
	
	NSString *alertMessage = [NSString stringWithFormat:@"%@", formValues];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:alertMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
}

@end
