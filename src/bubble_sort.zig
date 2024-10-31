const std = @import("std");
const expect = std.testing.expect;
const is_sorted = @import("utils.zig").is_sorted;

pub fn bubble_sort(arr: []i32) !void {
    for (0..arr.len) |i| {
        for (0..arr.len - 1 - i) |j| {
            if (arr[j] > arr[j + 1]) {
                const t = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = t;
            }
        }
    }
}

test "expect bubble_sort to sort given array in place" {
    var arr = [_]i32{ 4, 7, 8, 3, 4, 2, 1 };
    const expected = [_]i32{ 1, 2, 3, 4, 4, 7, 8 };
    try expect(!is_sorted(&arr));
    try bubble_sort(&arr);
    try expect(is_sorted(&arr));
    try expect(std.mem.eql(i32, &arr, &expected));
}
