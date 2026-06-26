
-- $background = {{base16.base00.dark.hex}}
-- foreground = {{colors.source_color.default.hex}} # on_surface
-- primary= {{colors.primary.default.hex}}
-- busy_color={{colors.error.default.hex_stripped}}
-- active_color={{colors.outline.default.hex_stripped}}
-- inactive_color={{colors.surface_variant.default.hex_stripped}}
--  "col.active_border" = "rgba(00eaffff) rgba(a020f0ff) 45deg";

hl.config = ({
  general = {
    -- col.active_border = rgba({{colors.primary.dark.hex_stripped}}ff) rgba({{base16.base01.dark.hex_stripped}}ff) 45deg # tertiary
    col.active_border = { colors = { "rgba(00eaffff)", "rgba(a020f0ff)" }, angle = 45 }
  }
}


