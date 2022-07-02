import Foundation

func linearSearch<T: Equatable>(in a: [T], withKey key: T) -> Int? {
    
    for i in 0..<a.count {
        if a[i] == key {
            return i
        }
    }
    return -1
}

func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        let guess = nums[mid]
        if guess == target {
            return mid
        }
        if guess > target {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return -1
}
