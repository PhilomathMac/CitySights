//
//  ContentModel.swift
//  CitySightsApp
//
//  Created by McKenzie Macdonald on 1/10/22.
//

import Foundation
import CoreLocation

class ContentModel : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // MARK: Properties
    var locationManager = CLLocationManager()
    
    // MARK: Init
    // Runs when a new instance of ContentModel is created
    override init() {
        
        // Init method of parent class: NSObject
        super.init()
        
        // Set ContentModel as delegate of locationManager
        locationManager.delegate = self
        
        // Request Permission
        locationManager.requestWhenInUseAuthorization()
        
        
    }
    
    // MARK: Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // We have permission to geolocate
            locationManager.startUpdatingLocation()
            
        } else if locationManager.authorizationStatus == .denied {
            
            // We don't have permission
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Gives us the location of the user
        let userLocation = locations.first
        
        if userLocation != nil {
            
            // Stop requesting location after we get it once (since we only need it once)
            locationManager.stopUpdatingLocation()
            
            // If we have the coordinates of the user, send into Yelp API
            // getBusinesses(category: "arts", location: userLocation!)
            getBusinesses(category: "restaurants", location: userLocation!)
            
        }
        
    }
    
    // MARK: Yelp API Methods
    
    func getBusinesses(category: String, location: CLLocation) {
        
        // Create URL
        // One way to create the url string using concatonation
        /* let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&logitude=\(location.coordinate.longitude)&categories=\(category)&limit=10"
         
            let url = URL(string: urlString)
         */
        
        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: String(category)),
            URLQueryItem(name: "limit", value: "10")
        
        ]
        
        let url = urlComponents?.url
        
        if let url = url {
            
            // Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            
            request.httpMethod = "GET"
            
            request.addValue("Bearer tBH8yWFcJNlJwNx0H3HHp76nRxtjO9iniV_jkxXal_tnjc4HUCCenkFfC1ltt4GRD_g-IipghJmjSkFppNZ6HZiq16kO_QL-nQSiY2ebivv0m2xC4v9K1dcQYqzcYXYx", forHTTPHeaderField: "Authorization")
            
            
            // Get URL Session
            
            let session = URLSession.shared
            
            // Create Data Task
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                // Check that there isn't an error
                if error == nil {
                    print(response)
                }
                
            }
            
            // Start the Data Task
            dataTask.resume()
        }
        

        
    }
    
}
