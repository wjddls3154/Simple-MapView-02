//
//  ViewController.swift
//  Simple MapView
//
//  Created by D7703_04 on 2018. 6. 4..
//  Copyright © 2018년 D7703_04. All rights reserved.
//
import UIKit
import MapKit
class ViewController: UIViewController {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    //pin 객체 저장
    var annotations = [MKPointAnnotation]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //번개반점
        //부산광역시 부산진구 양정1동 418-260
        //        //35.166043, 129.072564
        //        let center = CLLocationCoordinate2D(latitude: 35.166043, longitude: 129.072564)
        //        let span = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
        //        let region = MKCoordinateRegion(center: center, span: span)
        //        myMapView.setRegion(region, animated: true)
        //
        //        let region = MKCoordinateRegionMakeWithDistance(center, 1000, 1000)
        //        myMapView.setRegion(region, animated: true)
        
        //annotaion 추가
        let loc01 = CLLocationCoordinate2D(latitude: 35.167809, longitude: 129.070555)
        let anno01 = MKPointAnnotation()
        anno01.coordinate = loc01
        anno01.title = "번개반점"
        anno01.subtitle = "부산광역시 부산진구 양정1동 418-260"
        myMapView.addAnnotation(anno01)
        //
        //        let anno02 = MKPointAnnotation()
        //        anno02.coordinate = center
        //        anno02.title = "동의과학대학교"
        //        myMapView.addAnnotation(anno02)
        
        let foodStoreAddress = [ "부산광역시 부산진구 양정1동 418-260",
                                 "부산광역시 부산진구 양정동 350-1",
                                 "부산광역시 부산진구 양정동 393-18",
                                 "부산광역시 부산진구 양정1동 356-22",
                                 "부산광역시 부산진구 양정1동 산19-8",
                                 "부산광역시 부산진구 양정동 353-38"]
        
        for addr in foodStoreAddress {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(addr) {
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let myError = error {
                    print(myError)
                    return
                }
                
                if let myPlacemarks = placemarks {
                    let myPlacemark = myPlacemarks[0]
                    let loc = myPlacemark.location?.coordinate
                    
                    let anno = MKPointAnnotation()
                    anno.coordinate = loc!
                    anno.title = "wait!"
                    anno.subtitle = addr
                    //                    self.self.myMapView.addAnnotation(anno)
                    self.annotations.append(anno)
                    self.myMapView.addAnnotations(self.annotations)
                    self.myMapView.showAnnotations(self.annotations, animated: true)
                    
                    
                } else {
                    print("placemarks nil 발생")
                }
            }
        }
        
        
        
        
        
        
        //        let addr = "부산광역시 부산진구 양정1동 418-260"
        //        let geoCoder = CLGeocoder()
        //        geoCoder.geocodeAddressString(addr) {
        //            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
        //            if let error = error  {
        //                print(error)
        //                return
        //            }
        //            if placemarks != nil {
        //            let placemark = placemarks![0]
        //                print(placemark.location!.coordinate)
        ////
        ////                print(placemark.country)
        ////                print(placemark.name)
        //                print(placemark.location?.coordinate)
        //
        //
        //           let loc01 = placemark.location?.coordinate
        //           let anno01 = MKPointAnnotation()
        //           anno01.coordinate = loc01!
        //           anno01.title = "번개반점"
        //           anno01.subtitle = addr
        //           self.myMapView.addAnnotation(anno01)
        //
        //        }
        //    }
    }
}

