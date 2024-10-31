const std = @import("std");
const expect = std.testing.expect;

pub fn is_sorted(arr: []const i32) bool {
    var prev: i32 = arr[0];
    var result: bool = true;

    // least to greatest
    for (arr, 0..) |value, i| {
        if (i == 0) {
            prev = value;
        } else {
            if (value < prev) {
                result = false;
                break;
            }
        }
    }

    return result;
}

test "expect is_sorted to return true when the array is sorted from least to greatest" {
    try expect(is_sorted(&[_]i32{ 1, 2, 3, 4, 5 }));
}

test "expect is_sorted to return false when the array is sorted from greatest to least" {
    try expect(!is_sorted(&[_]i32{ 5, 4, 3, 2, 1 }));
}

test "expect is_sorted to return false when the array is not sorted from least to greatest" {
    try expect(!is_sorted(&[_]i32{ 2, 4, 1, 3, 5 }));
}
