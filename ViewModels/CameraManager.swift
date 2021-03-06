////
////  CameraManager.swift
////  FantasyWindow
////
////  Created by 赵翔宇 on 2022/2/8.
////
//
//import AVFoundation
//// 1
//class CameraManager: ObservableObject {
//
//  // 2相机授权状态
//  enum Status {
//    case unconfigured
//    case configured
//    case unauthorized
//    case failed
//  }
//  // 3
//  static let shared = CameraManager()
//  // 4
//  private init() {
//    configure()
//  }
//  // 5
//  private func configure() {
//  }
//
//    // 1
//    @Published var error: CameraError?
//    // 2
//    let session = AVCaptureSession()
//    // 3
//    private let sessionQueue = DispatchQueue(label: "com.raywenderlich.SessionQ")
//    // 4
//    private let videoOutput = AVCaptureVideoDataOutput()
//    // 5
//    private var status = Status.unconfigured
//
//
//    private func set(error: CameraError?) {
//      DispatchQueue.main.async {
//        self.error = error
//      }
//    }
//
//    private func checkPermissions() {
//      // 1
//      switch AVCaptureDevice.authorizationStatus(for: .video) {
//      case .notDetermined:
//        // 2
//        sessionQueue.suspend()
//        AVCaptureDevice.requestAccess(for: .video) { authorized in
//          // 3
//          if !authorized {
//            self.status = .unauthorized
//            self.set(error: .deniedAuthorization)
//          }
//          self.sessionQueue.resume()
//        }
//      // 4
//      case .restricted:
//        status = .unauthorized
//        set(error: .restrictedAuthorization)
//      case .denied:
//        status = .unauthorized
//        set(error: .deniedAuthorization)
//      // 5
//      case .authorized:
//        break
//      // 6
//      @unknown default:
//        status = .unauthorized
//        set(error: .unknownAuthorization)
//      }
//    }
//
//}
