//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

<<<<<<< HEAD
import path_provider_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
=======
import geolocator_apple
import location

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
  LocationPlugin.register(with: registry.registrar(forPlugin: "LocationPlugin"))
>>>>>>> 49335e27197d8d03a58e13405b3e5d2a77ce2cae
}
