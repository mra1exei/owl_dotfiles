# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    black, blue, cyan, green, magenta, red, white, yellow, default,
    normal, bold, reverse, dim, BRIGHT,
    default_colors,
)


class Default(ColorScheme):
    progress_bar_color = black

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                bg = black

#ЦВЕТ РАМКИ
            if context.border:
                fg = default

#ЦВЕТ ФАЙЛОВ КАРТИНОК
            if context.media:
                if context.image:
                    fg = white
                    fg += BRIGHT
                else:
                    fg = black

            if context.container:
                fg = black

#ЦВЕТ КАТАЛОГОВ
            if context.directory:
                attr |= bold
                fg = default
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                attr |= bold
                fg = black
            if context.socket:
                attr |= bold
                fg = black
            if context.fifo or context.device:
                fg = black
                if context.device:
                    attr |= bold
            if context.link:
                fg = black if context.good else magenta
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (black, magenta):
                    fg = white
                else:
                    fg = black
            if not context.selected and (context.cut or context.copied):
                attr |= bold
                fg = black
                # If the terminal doesn't support bright colors, use dim white
                # instead of black.
                if BRIGHT == 0:
                    attr |= dim
                    fg = white
            if context.main_column:
                # Doubling up with BRIGHT here causes issues because it's
                # additive not idempotent.
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = black
            if context.badinfo:
                if attr & reverse:
                    bg = black
                else:
                    fg = black

            if context.inactive_pane:
                fg = black

        elif context.in_titlebar:
            if context.hostname:
                fg = black if context.bad else black
            elif context.directory:
                fg = black
            elif context.tab:
                if context.good:
                    bg = black
            elif context.link:
                fg = black
            attr |= bold

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = black
                elif context.bad:
                    fg = black
            if context.marked:
                attr |= bold | reverse
                fg = black
            if context.frozen:
                attr |= bold | reverse
                fg = black
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = black
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = black
                attr &= ~bold
            if context.vcscommit:
                fg = black
                attr &= ~bold
            if context.vcsdate:
                fg = black
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = black

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = black
            elif context.vcsuntracked:
                fg = black
            elif context.vcschanged:
                fg = black
            elif context.vcsunknown:
                fg = black
            elif context.vcsstaged:
                fg = black
            elif context.vcssync:
                fg = black
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = black
            elif context.vcsbehind:
                fg = black
            elif context.vcsahead:
                fg = black
            elif context.vcsdiverged:
                fg = black
            elif context.vcsunknown:
                fg = black

        return fg, bg, attr
