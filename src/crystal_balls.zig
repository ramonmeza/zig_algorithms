const std = @import("std");
const expect = std.testing.expect;

pub fn two_crystal_balls(breaks: []const bool) ?usize {
    const jump_size: u64 = @as(u64, breaks.len);

    var i: usize = @as(usize, jump_size);
    while (i < breaks.len) {
        if (breaks[i]) {
            break;
        }
        i += jump_size;
    }

    i -= jump_size;

    var j: usize = 0;
    while (j < jump_size and i < breaks.len) {
        if (breaks[i]) {
            return i;
        }

        i += 1;
        j += 1;
    }

    return null;
}

test "expect two_crystal_balls to return correct index when given a boolean array" {
    try expect(two_crystal_balls(&[_]bool{ false, false, false, true, true, true }) == 3);
    try expect(two_crystal_balls(&[_]bool{ true, true, true, true }) == 0);
    try expect(two_crystal_balls(&[_]bool{ false, false, true, true }) == 2);
}

test "expect two_crystal_balls to returns null when the array does not contain a true value" {
    try expect(two_crystal_balls(&[_]bool{ false, false, false }) == null);
    try expect(two_crystal_balls(&[_]bool{
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
    }) == null);
    try expect(two_crystal_balls(&[_]bool{ false, false, false, false, false }) == null);
}
