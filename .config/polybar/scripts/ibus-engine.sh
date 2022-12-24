#!/usr/bin/bash
LOCK_ICON=

IBUS_RAW=$(ibus engine)
if [[ ${IBUS_RAW} == "xkb:us::eng" ]]; then
    IBUS_LANG="EN"
elif [[ ${IBUS_RAW} == "xkb:fi::fin" ]]; then
    IBUS_LANG="FI"
elif [[ ${IBUS_RAW} == "Unikey" ]]; then
    IBUS_LANG="VI"
fi
IBUS_LANG="${IBUS_LANG}"
OUTPUT="${IBUS_LANG}"

# toggle caps and num lock
CAPSLOCK=$(xset -q | grep "Caps Lock: *on")
NUMLOCK=$(xset -q | grep "Num Lock: *on")
OUTPUT_LOCK=""
if [ -n "${CAPSLOCK}" ]
then
    OUTPUT_LOCK=" ${LOCK_ICON} CAPS"
fi
if [ -n "${NUMLOCK}" ]
then
    if [ -n "${OUTPUT_LOCK}" ]
    then
        OUTPUT_LOCK="${OUTPUT_LOCK},Num"
    else
        OUTPUT_LOCK="${LOCK_ICON} Num"
    fi
fi

echo "$OUTPUT$OUTPUT_LOCK"
exit 0
