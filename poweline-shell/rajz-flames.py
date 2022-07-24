from powerline_shell.themes.default import DefaultColor


class Color(DefaultColor):
    USERNAME_FG = 0
    USERNAME_BG = 226
    USERNAME_ROOT_BG = 1

    HOSTNAME_FG = 250 #15
    HOSTNAME_BG = 238 #208

    HOME_SPECIAL_DISPLAY = True

    PATH_FG = 15
    PATH_BG = 166

    CWD_FG = 15

    SEPARATOR_FG = 14

    READONLY_BG = 1
    READONLY_FG = 7

    REPO_CLEAN_FG = 0
    REPO_CLEAN_BG = 226
    REPO_DIRTY_FG = 0
    REPO_DIRTY_BG = 160

    JOBS_FG = 4
    JOBS_BG = 8

    CMD_PASSED_FG = 0
    CMD_PASSED_BG = 10
    CMD_FAILED_FG = 15
    CMD_FAILED_BG = 160

    SVN_CHANGES_FG = REPO_DIRTY_FG
    SVN_CHANGES_BG = REPO_DIRTY_BG

    VIRTUAL_ENV_BG = 15
    VIRTUAL_ENV_FG = 2

    AWS_PROFILE_FG = 7
    AWS_PROFILE_BG = 2

    TIME_FG = 250
    TIME_BG = 238

    BATTERY_LOW_FG = 15
    BATTERY_LOW_BG = 160

    BATTERY_NORMAL_FG = 0
    BATTERY_NORMAL_BG = 2

    # https://github.com/ryanoasis/powerline-extra-symbols

    SYMBOLS = {
        "flames": {
            "lock": u"\uE0A2",
            "network": "SSH",
            "separator": u"\uE0C0 ",
            "separator_thin": u"\uE0C1"
        },
        "blocks": {
            "lock': u'\uE0A2",
            "network': u'\uE0A2",
            "separator': u'\uE0cc",
            "separator_thin': u'\uE0cd"
        },
        # angly 1
        "angly": {
                "lock": u"\uE0A2",
                "network": u"\uE0A2",
                "separator": u"\uE0B8",
                "separator_thin": u"\uE0B9"
        },
        # angly 2
        "angly2": {
          "lock": u"\uE0A2",
          "network": u"\uE0A2",
          "separator": u"\uE0BC",
          "separator_thin": u"\uE0BD"
        },
        # curvy
        "curvy": {
          "lock": u"\uE0A2",
          "network": u"\uE0A2",
          "separator": u"\uE0B4",
          "separator_thin": u"\uE0B5"
        },
        # lego (blocky)
        "blocky": {
          "lock": u"\uE0A2",
          "network": u"\uE0A2",
          "separator": u"\uE0CE",
          "separator_thin": u"\uE0CF"
        },
        # pixelated blocks 2 (large) random fade (pixey)
        "pixey": {
          "lock": u"\uE0A2",
          "network": u"\uE0A2",
          "separator": u"\uE0C6",
          "separator_thin": u"\uE0C6"
        }
        #/usr/local/lib/python3.6/dist-packages/powerline-shell
    }
