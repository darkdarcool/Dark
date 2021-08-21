import Foundation
import Darwin

let Args = args()

// Determine the file name
let filename = "darkfile.json"

// Read the contents of the specified file
let json = try! String(contentsOfFile: filename)

let helpText = """
Dark: Version JANK (0.0.1 for nerds)

Usage:

dark <command> [args]

-h --help:
  prints help command
"""
extension String {
    func toJSON() -> Any! {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

let dict = json.toJSON() as! [String:AnyObject]

let parsed = parser(args: Args.getArgs(), json: dict)

if (parsed.isHelp()) {
  print(helpText)
  exit(0)
}
// print("\(parsed.hasTasks())")

print("\(parsed.hasRun())")
