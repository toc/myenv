#!/bin/sh

NEXT="aclocal"
echo "Execute ${NEXT} ..."
${NEXT}

NEXT="autoconf"
echo "Execute ${NEXT} ..."
${NEXT}

NEXT="automake --add-missing --copy"
echo "Execute ${NEXT} ..."
${NEXT}
