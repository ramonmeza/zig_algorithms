const std = @import("std");
const expect = std.testing.expect;

fn linear_search(haystack: []const i32, needle: i32) bool {
    for (haystack) |value| {
        if (needle == value) {
            return true;
        }
    }
    return false;
}

test "expect linear_search to return true when element exists" {
    try expect(linear_search(&[_]i32{ 1, 2, 3, 4, 5 }, 3));
}

test "expect linear_search to return false when element does not exists" {
    try expect(!linear_search(&[_]i32{ 1, 2, 3, 4, 5 }, 6));
}
