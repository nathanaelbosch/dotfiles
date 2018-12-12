config.load_autoconfig()


BG = '#1d1f21'
FG = '#c5c8c6'
DARK_BLUE = '#5f819d'
DARK_GREEN = '#8c9440'

#c.colors.statusbar.normal.bg = BG
#c.colors.statusbar.normal.fg = FG
#c.colors.statusbar.insert.bg = DARK_GREEN
#c.colors.statusbar.insert.fg = FG
#c.colors.statusbar.passthrough.bg = DARK_BLUE
#c.colors.statusbar.passthrough.fg = FG
#c.colors.statusbar.command.bg = BG
#c.colors.statusbar.command.fg = FG
#c.colors.statusbar.url.fg = FG



HACK = '10pt Hack'
c.fonts.completion.entry = HACK
c.fonts.completion.category = HACK
c.fonts.debug_console = HACK
c.fonts.downloads = HACK
c.fonts.hints = HACK
c.fonts.keyhint = HACK
c.fonts.messages.error = HACK
c.fonts.messages.info = HACK
c.fonts.messages.warning = HACK
c.fonts.prompts = HACK
c.fonts.statusbar = HACK
c.fonts.tabs = HACK


c.statusbar.padding["bottom"] = 0
c.statusbar.padding["top"] = 0


c.auto_save.session = True
c.tabs.mode_on_change = 'restore'
c.confirm_quit = ['multiple-tabs']


config.bind('<Ctrl-Tab>', 'tab-next')
config.bind('<Ctrl-Shift-Tab>', 'tab-prev')
