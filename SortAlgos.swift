import Foundation

// recursive quickSort with filter + generics
func quickSort<T: Comparable>(_ nums: [T]) -> [T] {
    guard nums.count > 1 else { return nums}
    
    let pivot = nums[nums.count/2]
    let low = nums.filter { $0 < pivot }
    let equal = nums.filter { $0 == pivot }
    let high = nums.filter { $0 > pivot }
    
    return quickSort(low) + equal + quickSort(high)
}

// bubbleSort + inout + generics
func bubbleSort<T: Comparable>(_ nums: inout [T]) {
    guard nums.count > 1 else { return }
    
    for i in 0..<nums.count - 1 {
        for j in 0..<nums.count - 1 {
            if nums[j] > nums[j+1] {
                let tmp = nums[j]
                nums[j] = nums[j+1]
                nums[j+1] = tmp
            }
        }
    }
}
