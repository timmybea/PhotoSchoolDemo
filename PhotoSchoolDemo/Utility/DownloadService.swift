//
//  DownloadService.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-03.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import Foundation

struct DownloadService {
    
    func downloadVideo(_ url: URL) {

                let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

            let destinationUrl = docsUrl.appendingPathComponent("MyFileSaveName.mp4")
            if(FileManager().fileExists(atPath: destinationUrl.path)){
                    print("\n\nfile already exists\n\n")
                }
                else{
                    //DispatchQueue.global(qos: .background).async {
                        var request = URLRequest(url: URL(string: videoUrl)!)
                        request.httpMethod = "GET"
                        _ = session.dataTask(with: request, completionHandler: { (data, response, error) in
            if(error != nil){
                print("\n\nsome error occured\n\n")
                return
            }
            if let response = response as? HTTPURLResponse{
                if response.statusCode == 200{
                    DispatchQueue.main.async {
                        if let data = data{
                            if let _ = try? data.write(to: destinationUrl, options: Data.WritingOptions.atomic){
                                print("\n\nurl data written\n\n")
                            }
                            else{
                                print("\n\nerror again\n\n")
                            }
                        }//end if let data
                    }//end dispatch main
                }//end if let response.status
            }
        }).resume()
                    //}//end dispatch global
                }//end outer else
    }
    
}
