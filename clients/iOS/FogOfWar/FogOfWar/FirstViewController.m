//
//  FirstViewController.m
//  Mapgame
//
//  Created by Anne-Sophie Ettl on 16.04.14.
//  Copyright (c) 2014 Lab75. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property(nonatomic, strong) RMMapView *mapView;

@end

@implementation FirstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:@"lab75.hfmjgk5j"];
    self.mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:source];
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    self.mapView.zoom = 15;
    _mapView.centerCoordinate = CLLocationCoordinate2DMake(self.mapView.userLocation.coordinate.latitude, self.mapView.userLocation.coordinate.longitude);
    
    [self.view addSubview:self.mapView];
}

-(void) mapView:(RMMapView *)mapView didUpdateUserLocation:(RMUserLocation *)userLocation
{
    [mapView setUserTrackingMode:RMUserTrackingModeFollow];
}

- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.mapView.userLocation.location.coordinate.latitude, self.mapView.userLocation.coordinate.longitude];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
