import UIKit
import FutureKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.goBananas()
    }
    
    private var bananaCounter = 0
    
    private func goBananas() {
        let promise = Promise<NSDate>()
        Executor.UserInitiated.execute {
            promise.completeWithSuccess(NSDate())
        }
        promise.future.onSuccess(.Main) { _ in
            self.textLabel.text = "\(self.bananaCounter++)"
            self.goBananas()
        }
    }
}

