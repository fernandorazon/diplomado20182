//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Fernando Razon on 7/7/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    //Creando un mapa
    var mapView: MKMapView!
    
    //Cargando el mapa como la vista de este controlador
    override func loadView() {
        
        mapView = MKMapView()
        view = mapView
        
        //Se agrega una barra de botones segmentados con sus propiedades
        //Se internacioalizan los strings de los botones segmentados
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        //Se agrega un target-action
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //Se agregan constraints
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)

        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
    }
    
    //Funcion del selector de los botones segmentados
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break }
    }

    
   
    

    
    
    
}
