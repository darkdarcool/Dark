import Foundation

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
  public func hasTasks() -> Bool {
    if (json["tasks"] == nil) {
      return false
    }
    else {
      return true
    }
  }
}
