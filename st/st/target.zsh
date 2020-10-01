#                   ____  ____ ___  ____ ___
#                  / __ \/ __ `__ \/ __ `__ \
#                 / /_/ / / / / / / / / / / /
#                / .___/_/ /_/ /_/_/ /_/ /_/
#               /_/
#
#                 Personal Module Manager
#
#   MODULE: leyete/modules/st
#   TARGET: st

# [[[ TARGET FUNCTIONS

function target-latest-version() {
    git ls-remote --tags git://git.suckless.org/st | cut -d'/' -f3 | sort -Vr | head -1
}

function target-install() {
    git clone https://git.suckless.org/st source
    
    # (1) copy our configuration file.
    cp config.h source/config.h

    # (2) download and apply the patches.
    local suckless_patch="https://st.suckless.org/patches"
    declare -a patches; patches=(
        "$suckless_patch/alpha/st-alpha-0.8.2.diff"                                         # change background opacity.
        "${suckless_patch}/bold-is-not-bright/st-bold-is-not-bright-20190127-3be4cf1.diff"  # bold doesn't apply bright color.
        "${suckless_patch}/font2/st-font2-20190416-ba72400.diff"                            # add spare fonts.
    )
    ( cd source && for p ( $patches ); do curl -fSsL "$p" | patch -Np1; done )

    # (3) compile and install.
    ( cd source && make clean install PREFIX="${PWD:a:h}" )

    # (4) clean up.
    rm -rf source
}

# ]]]

# [[[ TARGET INFORMATION

TARGET_DEP_ARCH=( libx11 libxft libxext )
TARGET_DEP_DEBIAN=( libx11-dev libxft-dev libxext-dev )
TARGET[dependencies]=${(Pe)${:-"TARGET_DEP_${(U)PMMDIST}"}}

# ]]]

# vim: ft=zsh foldenable fdm=marker foldmarker=[[[,]]] et fenc=utf-8
