#                   ____  ____ ___  ____ ___
#                  / __ \/ __ `__ \/ __ `__ \
#                 / /_/ / / / / / / / / / / /
#                / .___/_/ /_/ /_/_/ /_/ /_/
#               /_/
#
#                 Personal Module Manager
#
#   MODULE: leyete/modules/st

# [[[ MODULE INFO

# Module description: Basic module description.
MODULE[description]="st terminal emulator (suckless.org)."

# Module targets: List of targets to install.
declare -a MODULE_TARGETS_ARCH MODULE_TARGETS_DEBIAN

MODULE_TARGETS_ARCH=( st )    # add arch-specific module targets.
MODULE_TARGETS_DEBIAN=( st )  # add debian-specific module targets.
MODULE[targets]=${(j/,/)${(Pe)${:-"MODULE_TARGETS_${(U)PMMDIST}"}}}

# ]]]

# vim: ft=zsh foldenable fdm=marker foldmarker=[[[,]]] et fenc=utf-8
