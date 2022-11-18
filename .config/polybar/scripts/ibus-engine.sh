#!/usr/bin/bash
# Change me! use any icons you like
ENGINE_ICON=異
LANG_ICON=
LOCK_ICON=

IBUS_RAW=`ibus engine`
# read currently used engine(xkb, m17n, rime, etc...)
IBUS_ENGINE=`echo $IBUS_RAW | awk -F ':' '{print $1}'`
# read currently used layout(ca, jp, fr, etc...)
IBUS_LAYOUT=`echo $IBUS_RAW | awk -F ':' '{print $2}'`
# read currently used layout variant(de, dvorak, etc...)
IBUS_LAYOUT_VARIANT=`echo $IBUS_RAW | awk -F ':' '{print $3}'`
# read currently used language(eng, ger, unicode, etc...)
if [[ ${IBUS_RAW} == "xkb:us::eng" ]]; then
    IBUS_LANG="EN"
elif [[ ${IBUS_RAW} == "xkb:fi::fin" ]]; then
    IBUS_LANG="FI"
elif [[ ${IBUS_RAW} == "Unikey" ]]; then
    IBUS_LANG="VI"
fi
IBUS_LANG="${IBUS_LANG}"
# IBUS_LANG=`echo $IBUS_RAW | awk -F ':' '{print $4}'`


# if [ -z "${IBUS_LAYOUT}" ] || [ "${IBUS_LAYOUT}" = "\n" ]
# then
#     IBUS_LAYOUT=sys
# fi
#
# OUTPUT="${ENGINE_ICON} ${IBUS_ENGINE}"
# if [ -n "${IBUS_LAYOUT_VARIANT}" ] && [ "${IBUS_LAYOUT_VARIANT}" != "\n" ]
# then
#     OUTPUT="${OUTPUT} - ${IBUS_LAYOUT_VARIANT}"
# else
#     OUTPUT="${OUTPUT} "
# fi
#
# if [ -n "${IBUS_LANG}" ] && [ "${IBUS_LANG}" != "\n" ]
# then
#     OUTPUT="${OUTPUT} ${IBUS_LANG}"
# fi
OUTPUT="${IBUS_LANG}"

# toggle caps and num lock
CAPSLOCK=`xset -q | grep "Caps Lock: *on"`
NUMLOCK=`xset -q | grep "Num Lock: *on"`
OUTPUT_LOCK=""
if [ -n "${CAPSLOCK}" ]
then
    OUTPUT_LOCK="${LOCK_ICON} Caps"
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

echo $OUTPUT $OUTPUT_LOCK
exit 0
