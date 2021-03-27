import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import System.Exit

import XMonad hiding ( (|||) )
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Renamed
import XMonad.Actions.CycleWS
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

term = "st -e tmux"
browser = "firefox"
launcher = "dmenu_run"

myFocusFollowsMouse = True
myClickJustFocuses = False
mySpacing = 5

myWorkspaces   = ["1","2","3","4","5","6","7","8","9"]

applySpacing l = gaps [(d, s) | d <- [U,D,L,R], s <- [mySpacing]] $ spacing mySpacing l

myLayoutHook = noBorders $ renamed [Replace "tiled"] (avoidStruts $ applySpacing tiled)
    ||| Full
        where
            tiled = Tall nmaster delta ratio

            nmaster = 1
            ratio   = 1/2
            delta   = 3/100

myManageHook = composeAll
    [ className =? "hl_linux"  --> doFloat
    , className =? "hl2_linux" --> doFloat ]

myKeys conf@(XConfig { XMonad.modMask = modm }) = M.fromList $
            -- Applications
            [ ((modm,                xK_Return    ), spawn term)
            , ((modm,                xK_BackSpace ), spawn browser)
            , ((modm,                xK_d         ), spawn launcher)
            , ((modm .|. shiftMask,  xK_v         ), spawn "discord")

            -- Music
            , ((0,                   xK_F4        ), spawn "mpc toggle")
            , ((0,                   xK_F5        ), spawn "mpc prev")
            , ((0,                   xK_F6        ), spawn "mpc next")
            , ((0,                   xK_F7        ), spawn "mpc vol -5")
            , ((0,                   xK_F8        ), spawn "mpc vol +5")

            -- Control
            , ((modm .|. shiftMask,  xK_q         ), kill)

            , ((modm,                xK_j         ), windows W.focusDown)
            , ((modm,                xK_k         ), windows W.focusUp)
            , ((modm .|. shiftMask,  xK_j         ), windows W.swapDown)
            , ((modm .|. shiftMask,  xK_k         ), windows W.swapUp)

            , ((modm,                xK_z         ), windows W.swapMaster)

            , ((modm,                xK_h         ), sendMessage Shrink)
            , ((modm,                xK_l         ), sendMessage Expand)
            , ((modm .|. shiftMask,  xK_h         ), sendMessage Shrink)
            , ((modm .|. shiftMask,  xK_l         ), sendMessage Expand)

            , ((modm .|. shiftMask,  xK_space     ), withFocused $ windows . W.sink)

            -- Layout switching
            , ((modm,                xK_r         ), sendMessage $ JumpToLayout "tiled")
            , ((modm,                xK_f         ), sendMessage $ JumpToLayout "Full")

            , ((modm .|. shiftMask,  xK_e         ), io (exitWith ExitSuccess))
            , ((modm .|. shiftMask,  xK_r         ), spawn "xmonad --recompile; xmonad --restart")

            --- Multiple screens
            , ((modm,                xK_comma     ), prevScreen)
            , ((modm,                xK_period    ), nextScreen)
            , ((modm .|. shiftMask,  xK_comma     ), shiftPrevScreen)
            , ((modm .|. shiftMask,  xK_period    ), shiftNextScreen)
            ]
            ++

            -- Workspace setting and switching
            [((m .|. modm, k), windows $ f i)
                | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
                , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

baseConfig = docks $ ewmh def
            { keys              = myKeys
            , mouseBindings     = myMouseBindings
            , layoutHook        = myLayoutHook
            , manageHook        = myManageHook
            , focusFollowsMouse = myFocusFollowsMouse
            , clickJustFocuses  = myClickJustFocuses
            , modMask           = mod4Mask
            , terminal          = term
            }
    
main = xmonad $ baseConfig
