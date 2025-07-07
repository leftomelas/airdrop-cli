//
//  ConsoleIO.swift
//  airdrop
//
//  Created by Volodymyr Klymenko on 2020-12-30.
//

import Foundation

enum OutputType {
    case error
    case standard
}

class ConsoleIO {
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("\n❌ Error: \(message)\n", stderr)
        }
    }

    func printUsage() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent

        writeMessage("USAGE: \(executableName) <file1> [file2] [file3] ...")
        writeMessage("    file1, file2, file3, ... – URLs or paths to files to AirDrop")
        writeMessage("    You can specify multiple items - both local files and web URLs, and you can mix them too.")
        writeMessage("\nEXAMPLES:")
        writeMessage("    \(executableName) document.pdf")
        writeMessage("    \(executableName) image1.jpg image2.png")
        writeMessage("    \(executableName) file.txt https://apple.com/")
        writeMessage("\nOPTIONS:")
        writeMessage("    -h, --help – print help info")
    }
}
