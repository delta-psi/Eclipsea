
-- { colors = { "rgba(00eaffff)", "rgba(a020f0ff)" }, angle = 45 }

hl.config({
  general = {
    ["col.active_border"] = { colors = { "rgba({{colors.primary.dark.hex_alpha_stripped}})", "rgba({{colors.tertiary.dark.hex_alpha_stripped}})" }, angle = 45 }
  },
  decoration = {
    shadow = {
      -- color = { colors = { "rgba({{colors.primary.dark.hex_alpha_stripped}})", "rgba({{colors.tertiary.dark.hex_alpha_stripped}})" }, angle = 45 }
      color = "rgba({{colors.primary.dark.hex_alpha_stripped}})"
      -- color = "rgba({{colors.primary.dark.hex_alpha_stripped}}), rgba({{colors.tertiary.dark.hex_alpha_stripped}})"
    },
    glow = {
      color = "rgba({{colors.primary.dark.hex_alpha_stripped}})"
    }
  }
})

