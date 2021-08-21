import Foundation


@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}


class parser {
  let args: Array<Any>
  let json: [String : AnyObject]
  init(args: Array<Any>, json: [String : AnyObject]) {
    self.args = args
    self.json = json
  }
  public func isHelp() -> Bool {
    let args = self.args
    return args.isEmpty
  }
  public func hasRun() -> Bool {
    if (self.args[0] as! String == "run") { return true }
    else {
      return false
    }
  }
  public func hasTasks() -> Bool {
    if (json["tasks"] == nil) {
      return false
    }
    else {
      return true
    }
  }
  public func run(command: String) -> Any {
    return shell(command)
  }
}
