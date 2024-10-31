const std = @import("std");
const expect = std.testing.expect;
const is_sorted = @import("utils.zig").is_sorted;

pub fn binary_search(haystack: []const i32, needle: i32) bool {
    if (!is_sorted(haystack)) {
        // binary_search not implemented on arrays that are not sorted
        return false;
    }

    var lo: usize = 0;
    var hi: usize = haystack.len;

    while (lo < hi) {
        const m: usize = lo + (hi - lo) / 2;
        const val: i32 = haystack[m];

        if (val == needle) {
            return true;
        } else if (val < needle) {
            lo = m + 1;
        } else {
            hi = m;
        }
    }

    return false;
}

test "expect binary_search to return true if the value is in the given sorted array" {
    try expect(binary_search(&[_]i32{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }, 7));
    try expect(binary_search(&[_]i32{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }, 5));
}

test "expect binary_search to return false if the value is not in the given sorted array" {
    try expect(!binary_search(&[_]i32{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }, 11));
    try expect(!binary_search(&[_]i32{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }, 10));
}

test "expect binary_search to return false if the given array is not sorted" {
    try expect(!binary_search(&[_]i32{ 4, 2, 6, 3, 0, 5 }, 7));
    try expect(!binary_search(&[_]i32{ 9, 0, 6, 2, 4, 1 }, 1));
    try expect(!binary_search(&[_]i32{ 2, 7, 4, 3, 0 }, 5));
}
