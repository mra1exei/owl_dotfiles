-- ИМПОРТ МОДУЛЕЙ
import XMonad
import Data.Monoid
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import System.IO
-- Автозапуск: 
import XMonad.Util.SpawnOnce
-- Модуль для запуска xmobar
import XMonad.Util.Run


-- ЭМУЛЯТОР ТЕРМИНАЛА
myTerminal      = "st"

-- СЛЕДУЕТ ЛИ ФОКУС ЗА КУРСОРОМ МЫШИ
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- БУДЕТ ЛИ ЦЕЛЧОК ПО ОКНУ ДЛЯ ФОКУСИРОВКИ ТАК ЖЕ ПЕРЕДОВАТЬ ЩЕЛЧОК ОКНУ
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- ТОЛЦИНА РАМКИ В ПИКСЕЛЯХ
myBorderWidth   = 1

-- КЛАВИША МОДИФИКАТОР mod1Mask - ЛЕВЫЙ АЛЬТ, mod3Mask - ПРАВЫЙ АЛЬТ, mod4Mask - WIN
myModMask       = mod4Mask

-- ВОРКСПЕЙСЫ
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- ЦВЕТ РАМКИ ОКОН
myNormalBorderColor  = "#1e1e2e"
myFocusedBorderColor = "#d9e0ee"


------------------------------------------------------------------------
-- ХОТКЕИ
------------------------------------------------------------------------
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- ТЕРМИНАЛ
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)

    -- DMENU
    , ((modm,               xK_d     ), spawn "dmenu_run")

    -- GMRUN
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- ЗАКРЫТЬ АКТИВНОЕ ОКНО
    , ((modm,               xK_c     ), kill)

     -- ИЗМЕНИТЬ КОМПАНОВКУ ОКОН
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  ВЕРНУТЬ КОМПАНОВКУ ОКОН ВЗАД
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- ПЕРЕКЛЮЧЕНИЕ МЕЖДУ ОКНАМИ
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- ПЕРЕКЛЮЧИТЬ ФОКУС НА СЛЕДУЮЩЕЕ ОКНО
    , ((modm,               xK_Left  ), windows W.focusDown)

    -- ПЕРЕКЛЮЧИТЬ ФОКУС НА ПРЕДЫДУЩЕЕ ОКНО
    , ((modm,               xK_Right ), windows W.focusUp  )

    -- ПЕРЕКЛЮЧИТЬ ФОКУС НА МАСТЕР ОКНО
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- ПОМЕНЯТЬ МЕСТАМИ МАСТЕР ОКНО И ТЕКУЩЕЕ ОКНО
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)

    -- ПОМЕНЯТЬ МЕСТАМИ ТЕКУЩЕЕ ОКНО И СЛЕДУЮЩЕ ЗА НИМ ОКНО
    , ((modm .|. shiftMask, xK_Left  ), windows W.swapDown  )

    -- ПОМЕНЯТЬ МЕСТАМИ ТЕКУЩЕЕ ОКНО И ПРЕДШЕСТВУЮЩЕЕ ЕМУ ОКНО
    , ((modm .|. shiftMask, xK_Right ), windows W.swapUp    )

    -- УМЕНЬШИТЬ МАСТЕР ОКНО
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- УВЕЛИЧИТЬ МАСТЕР ОКНО
    , ((modm,               xK_l     ), sendMessage Expand)

    -- СДЕЛАТЬ ОКНО ТАЙЛОВЫМ, ЕСЛИ ОНО БЫЛО ПЛАВАЮЩИМ
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- УВЕЛИЧИТЬ КОЛИЧЕСТВО МАСТЕР ОКОН
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- УМЕНЬШИТЬ КОЛИЧЕСТВО МАСТЕР ОКОН
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))




    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)




    -- ВЫЙТИ
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- ПЕРЕЗАПУСТИТЬ
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- ПОКАЗАТЬ СПРАВКУ ПО ХОТКЕЯМ, У МЕНЯ НЕ РАБОТАЕТ, Я НЕ ПЫТАЛСЯ ЭТО ИСПРАВИТЬ.
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    ++

    -- MOD+1...9 ПЕРЕКЛЮЧИТСЯ НА ВОРКСПЕЙС, MOD+SHIFT+1...9 ПЕРЕМЕСТИТЬ ОКНО НА ВОРКСПЕЙС
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    -- MOD+W,E,R ПЕРЕКЛЮЧИТСЯ НА 2Й ИЛИ 3Й МОНИТОР, MOD+SHIFT+W,E,R ПЕРЕМЕСТИТЬ ОКНО НА 2Й ИЛИ 3Й МОНИТОР
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- НАСТРОЙКА КЛАВИШЬ МЫШИ
------------------------------------------------------------------------
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, СДЕЛАТЬ ОКНО ПЛАВАЮЩИМ
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, ПОДНЯТЬ ОКНО НА ВЕРШИНУ СТЕКА
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, СДЕЛАТЬ ОКНО ПЛАВАЮЩИМ И ИЗМЕНИТЬ ЕГО РАЗМЕР
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]


------------------------------------------------------------------------
-- МАКЕТЫ
------------------------------------------------------------------------
myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
     -- РЕЖИМ ТАЙЛИНГА
     tiled   = Tall nmaster delta ratio

     -- КОЛИЧЕСТВО МАСТЕР ОКОН ПО ДЕФОЛТУ
     nmaster = 1

     -- ПРОПОРЦИИ ЭКРАНА МЕЖДУ МАСТЕР ОКНОМ И ОСТАЛЬНЫМИ
     ratio   = 1/2

     -- ШАГ В ПРОЦЕНТАХ ПРИ РЕСАЙЗЕ ОКНА
     delta   = 3/100


------------------------------------------------------------------------
-- ПРАВИЛА ОКОН
------------------------------------------------------------------------
-- ДЛЯ ТОГО ЧТО БЫ УЗНПТЬ КЛАСС ОКНА НУЖНО ЗАЮЗАТЬ xprop | grep WM_CLASS
-- ПО МИМО КЛАССА МОЖНО ЮЗАТЬ 'title', 'className' И 'resource'

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]


------------------------------------------------------------------------
-- Event handling
------------------------------------------------------------------------
-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty


------------------------------------------------------------------------
-- Status bars and logging
------------------------------------------------------------------------
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()


------------------------------------------------------------------------
-- АВТОЗАПУСК
------------------------------------------------------------------------
myStartupHook = do
     spawnOnce "nitrogen --restore &"
     spawnOnce "firefox"


------------------------------------------------------------------------

-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do
     xmproc0 <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc"
     xmonad $ docks defaults
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }


-- | ПО ХОДУ ЭТО И ЕСТЬ ТА САМАЯ СПРАВКА КОТОРУЮ Я НЕ СМОГ ЗАПУСТИТЬ.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
