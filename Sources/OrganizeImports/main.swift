import Files
import Foundation

// MARK: - Constants
struct C {
    struct Options {
        static let directory = "-dir"
        static let file = "-file"
    }

    struct File {
        static let `extension` = "swift"
        static let prefix = "import "
    }

    struct Message {
        static let invalidNumberOfArguments = "👮  Invalid number of arguments"
        static let invalidOptions = "🤷‍♂️  Invalid option. Use -dir [directory_path] or -file [file_path]"
        static let noFiles = "🙅‍♂️  No .\(C.File.extension) files found"
        static let sortedImports = "Sorted imports in file:"
        static let done = "😎  Imports organized! Time:"
    }
}

// MARK: - Helper functions
func getNewLineSign(from string: String) -> String? {
    guard let rangeOfNewLineSign = string.rangeOfCharacter(from: .newlines) else {
        return nil
    }

    let substring = string[rangeOfNewLineSign]
    return String(substring)
}

func getFiles(with option: String, argument arg: String) throws -> [File]? {
    if option == C.Options.directory {
        return try Folder(path: arg).files.recursive
            .filter({ (file) -> Bool in
                if let fileExtension = file.extension, fileExtension == C.File.extension {
                    return true
                }
                return false
            })
    } else if option == C.Options.file {
        return try [File(path: arg)]
    }

    return nil
}

func enumerate(_ files: [File]) throws {
    for file in files.enumerated() {
        let fileString = try file.element.readAsString()

        var linesArray = fileString.components(separatedBy: .newlines)
        let importsArray = linesArray.enumerated().map { $0 }.filter { $0.element.hasPrefix(C.File.prefix) }

        let sortedImportsByString = importsArray.sorted(by: { $0.element < $1.element })
        let sortedImportsByLineIndex = importsArray.sorted(by: { $0.offset < $1.offset })

        if importsArray.map({ $0.1 }) == sortedImportsByString.map({ $0.1 }) {
            continue //Correct imports order. Skipping file
        }

        for (index, item) in sortedImportsByLineIndex.enumerated() {
            linesArray[item.offset] = sortedImportsByString[index].element
        }

        if let newLineSign = getNewLineSign(from: fileString) {
            let sortedString = linesArray.joined(separator: newLineSign)
            print(C.Message.sortedImports, file.1.name)
            try file.1.write(sortedString)
        }
    }
}

// MARK: - Script
let startDate = Date()

let arguments = CommandLine.arguments

guard arguments.count == 3 else {
    print(C.Message.invalidNumberOfArguments)
    print(C.Message.invalidOptions)
    exit(1)
}

guard arguments[1] == C.Options.directory || arguments[1] == C.Options.file else {
    print(C.Message.invalidOptions)
    exit(1)
}

let option = arguments[1]
let arg = arguments[2]

let files = try getFiles(with: option, argument: arg)

guard let files = files, !files.isEmpty else {
    print(C.Message.noFiles)
    exit(1)
}

try enumerate(files)

let endDate = Date()
let computingTime = round(endDate.timeIntervalSince(startDate) * 1000.0)

print(C.Message.done, "\(computingTime)ms")
exit(0)
