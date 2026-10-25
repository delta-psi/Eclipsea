
-- { colors = { "rgba(00eaffff)", "rgba(a020f0ff)" }, angle = 45 }

-- return {
--   borderThemeAccented = {
--     active_border = { colors = { "rgba({{colors.primary.dark.hex_alpha_stripped}})", "rgba({{colors.tertiary.dark.hex_alpha_stripped}})" }, angle = 45 },
--     shadow = { colors = { "rgba({{colors.primary.dark.hex_alpha_stripped}})", "rgba({{colors.tertiary.dark.hex_alpha_stripped}})" }, angle = 45 },
--     glow = { colors = { "rgba({{colors.primary.dark.hex_alpha_stripped}})", "rgba({{colors.tertiary.dark.hex_alpha_stripped}})" }, angle = 45 }
--   },
--   borderThemeSleek = {
--     active_border = { colors = { "rgba({{colors.surface_container.dark.hex_alpha_stripped}})", "rgba({{colors.surface.dark.hex_alpha_stripped}})" }, angle = 45 },
--     shadow = { colors = { "rgba({{colors.surface_container.dark.hex_alpha_stripped}})", "rgba({{colors.surface.dark.hex_alpha_stripped}})" }, angle = 45 },
--     glow = { colors = { "rgba({{colors.surface_container.dark.hex_alpha_stripped}})", "rgba({{colors.surface.dark.hex_alpha_stripped}})" }, angle = 45 }
--   }
-- }

hl.config({
  general = {
    ["col.active_border"] = { colors = { "rgba({{colors.primary.dark.hex_alpha_stripped}})", "rgba({{colors.tertiary.dark.hex_alpha_stripped}})" }, angle = 45 }
    -- ["col.active_border"] = { colors = { "rgba({{colors.surface_container.dark.hex_alpha_stripped}})", "rgba({{colors.surface.dark.hex_alpha_stripped}})" }, angle = 45 }

  },
  decoration = {
    shadow = {
      -- color = { colors = { "rgba({{colors.primary.dark.hex_alpha_stripped}})", "rgba({{colors.tertiary.dark.hex_alpha_stripped}})" }, angle = 45 }
      -- color = "rgba({{colors.primary.dark.hex_alpha_stripped}})"
      color = { colors = { "rgba({{colors.primary.dark.hex_alpha_stripped}})", "rgba({{colors.tertiary.dark.hex_alpha_stripped}})" }, angle = 45 }
      -- color = { colors = { "rgba({{colors.surface_container.dark.hex_alpha_stripped}})", "rgba({{colors.surface.dark.hex_alpha_stripped}})" }, angle = 45 }
    },
    glow = {
      -- color = "rgba({{colors.primary.dark.hex_alpha_stripped}})"
      color = { colors = { "rgba({{colors.primary.dark.hex_alpha_stripped}})", "rgba({{colors.tertiary.dark.hex_alpha_stripped}})" }, angle = 45 }
      -- color = { colors = { "rgba({{colors.surface_container.dark.hex_alpha_stripped}})", "rgba({{colors.surface.dark.hex_alpha_stripped}})" }, angle = 45 }

    }
  }
})

