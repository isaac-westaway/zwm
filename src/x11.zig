const std = @import("std");

pub const c = @cImport({
    @cInclude("X11/Xlib.h");
    @cInclude("X11/XF86keysym.h");
    @cInclude("X11/keysym.h");
    @cInclude("X11/XKBlib.h");
    @cInclude("X11/Xatom.h");
    @cInclude("X11/Xutil.h");
});

pub fn setWindowPropertyScalar(d: *c.Display, w: c.Window, property: c.Atom, property_type: c.Atom, data: anytype) void {
    const long_data = @as(c_ulong, data);
    _ = c.XChangeProperty(d, w, property, property_type, 32, c.PropModeReplace, std.mem.asBytes(&long_data), 1);
}
