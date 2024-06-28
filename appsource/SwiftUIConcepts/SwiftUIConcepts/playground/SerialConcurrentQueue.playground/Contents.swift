import UIKit


/*
 Serial Queues: Useful for ordered execution and preventing race conditions with shared resources.
 Concurrent Queues: Useful for running multiple tasks in parallel to improve performance.
 Synchronous Execution: Blocks the current thread until the task completes, suitable for quick or dependent tasks.
 Asynchronous Execution: Runs tasks in the background, keeping the application responsive, suitable for long-running or independent tasks.

 */

let serialQueue = DispatchQueue(label: "com.example.serialQueue")
let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

//serialQueue.async {
//    print("serialQueue.async Task 1 started")
//    sleep(2)
//    print("serialQueue.async Task 1 completed")
//}
//
//serialQueue.async {
//    print("serialQueue.async Task 2 started")
//    sleep(1)
//    print("serialQueue.async Task 2 completed")
//}
//
//print("This prints immediately after scheduling tasks")

/*
 serialQueue.async Task 1 started
 This prints immediately after scheduling tasks
 serialQueue.async Task 1 completed
 serialQueue.async Task 2 started
 serialQueue.async Task 2 completed
 */


//serialQueue.sync {
//    print("serialQueue.sync Task 1 started")
//    sleep(2)
//    print("serialQueue.sync Task 1 completed")
//}
//
//serialQueue.sync {
//    print("serialQueue.sync Task 2 started")
//    sleep(1)
//    print("serialQueue.sync Task 2 completed")
//}
//
//print("This prints immediately after scheduling tasks")
//

/*
 serialQueue.sync Task 1 started
 serialQueue.sync Task 1 completed
 serialQueue.sync Task 2 started
 serialQueue.sync Task 2 completed
 This prints immediately after scheduling tasks
 */

//concurrentQueue.async {
//    print("concurrentQueue async Task 1 started")
//    sleep(2)
//    print("concurrentQueue async  Task 1 completed")
//}
//
//concurrentQueue.async {
//    print("concurrentQueue async  Task 2 started")
//    sleep(1)
//    print("concurrentQueue async  Task 2 completed")
//}
//
//print("concurrentQueue async  This prints immediately after scheduling tasks")


/*
 concurrentQueue async Task 1 started
 concurrentQueue async  This prints immediately after scheduling tasks
 concurrentQueue async  Task 2 started
 concurrentQueue async  Task 2 completed
 concurrentQueue async  Task 1 completed
 */


//
//concurrentQueue.sync {
//    print("concurrentQueue.sync Task 1 started")
//    sleep(2)
//    print("concurrentQueue.sync  Task 1 completed")
//}
//
//concurrentQueue.sync {
//    print("concurrentQueue.sync  Task 2 started")
//    sleep(1)
//    print("concurrentQueue.sync  Task 2 completed")
//}
//
//print("concurrentQueue async  This prints immediately after scheduling tasks")


/*
 concurrentQueue.sync {
     print("concurrentQueue.sync Task 1 started")
     sleep(2)
     print("concurrentQueue.sync  Task 1 completed")
 }

 concurrentQueue.sync {
     print("concurrentQueue.sync  Task 2 started")
     sleep(1)
     print("concurrentQueue.sync  Task 2 completed")
 }

 print("concurrentQueue async  This prints immediately after scheduling tasks")
 */




