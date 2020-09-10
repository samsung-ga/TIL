import Cocoa
import SwiftUI

class TestClass{
    let aConstant = 5
    
    init(){
        print("init")
    }
    deinit{
        print("deinit")
    }
    func doSomething(){
        UIView.animate(withDuration: 5){
            let aConstant = self.aConstant
            
            // fancy animation ... .
        }
    }
}

var testClass: TestClass? = TestClass()
testClass?.doSomething()
testClass = nil
