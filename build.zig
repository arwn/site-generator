const std = @import("std");
const zine = @import("zine");

pub fn build(b: *std.Build) !void {
    zine.website(b, .{
        .title = "arwn",
        .host_url = "https://arwn.github.io",
        .layouts_dir_path = "layouts",
        .content_dir_path = "content",
        .assets_dir_path = "assets",
        .static_assets = &.{
            "CNAME",
            // Fonts referenced in CSS files
            "fonts/BebasNeue-Regular.ttf",
            "fonts/Merriweather-Black.ttf",
            "fonts/Merriweather-BlackItalic.ttf",
            "fonts/Merriweather-Bold.ttf",
            "fonts/Merriweather-BoldItalic.ttf",
            "fonts/Merriweather-Italic.ttf",
            "fonts/Merriweather-Light.ttf",
            "fonts/Merriweather-LightItalic.ttf",
            "fonts/Merriweather-Regular.ttf",
            "fonts/MonaspaceNeon-Bold.woff",
            "fonts/MonaspaceNeon-Bold.woff2",
            "fonts/MonaspaceNeon-Light.woff",
            "fonts/MonaspaceNeon-Light.woff2",
            "fonts/MonaspaceNeon-Medium.woff",
            "fonts/MonaspaceNeon-Medium.woff2",
            "fonts/MonaspaceNeon-Regular.woff",
            "fonts/MonaspaceNeon-Regular.woff2",
            "fonts/MonaspaceNeon-SemiBold.woff",
            "fonts/MonaspaceNeon-SemiBold.woff2",
            "fonts/MonaspaceNeonVarVF[wght,wdth,slnt].woff",
            "fonts/MonaspaceNeonVarVF[wght,wdth,slnt].woff2",

            "fonts/jbm/JetBrainsMono-Bold.woff2",
            "fonts/jbm/JetBrainsMono-BoldItalic.woff2",
            "fonts/jbm/JetBrainsMono-ExtraBold.woff2",
            "fonts/jbm/JetBrainsMono-ExtraBoldItalic.woff2",
            "fonts/jbm/JetBrainsMono-ExtraLight.woff2",
            "fonts/jbm/JetBrainsMono-ExtraLightItalic.woff2",
            "fonts/jbm/JetBrainsMono-Italic.woff2",
            "fonts/jbm/JetBrainsMono-Light.woff2",
            "fonts/jbm/JetBrainsMono-LightItalic.woff2",
            "fonts/jbm/JetBrainsMono-Medium.woff2",
            "fonts/jbm/JetBrainsMono-MediumItalic.woff2",
            "fonts/jbm/JetBrainsMono-Regular.woff2",
            "fonts/jbm/JetBrainsMono-SemiBold.woff2",
            "fonts/jbm/JetBrainsMono-SemiBoldItalic.woff2",
            "fonts/jbm/JetBrainsMono-Thin.woff2",
            "fonts/jbm/JetBrainsMono-ThinItalic.woff2",
        },
        .build_assets = &.{
            .{
                .name = "zon",
                .lp = b.path("build.zig.zon"),
            },
            .{
                .name = "frontmatter",
                .lp = b.dependency("zine", .{}).path(
                    "frontmatter.ziggy-schema",
                ),
            },
        },
        .debug = true,
    });

    // This line creates a build step that generates an updated
    // Scripty reference file. Other sites will not need this
    // most probably, but at least it's an example of how Zine
    // can integrate neatly with other Zig build steps.
    zine.scriptyReferenceDocs(
        b,
        "content/docs/superhtml/scripty.smd",
        "content/docs/supermd/scripty.smd",
    );
}
