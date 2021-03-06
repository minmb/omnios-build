#!/usr/bin/bash
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2011-2013 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=apcupsd
VER=3.14.11
VERHUMAN=$VER
PKG=system/management/apcupsd
SUMMARY="APC UPS Power Management (daemon)"
DESC="apcupsd provides UPS power management for APC products, including most BackUPS series models (including USB), SmartUPS V/S, SmartUPS (NET/RM), and Matrix series."

BUILD_DEPENDS_IPS=
RUN_DEPENDS_IPS=

install_smf() {
  logmsg "Installing SMF components"
  logcmd mkdir -p $DESTDIR/lib/svc/manifest/$(dirname $PKG) || \
        logerr "--- Failed to create manifest directory"
  logcmd cp $SRCDIR/apcupsd.xml $DESTDIR/lib/svc/manifest/$(dirname $PKG)/ || \
        logerr "--- Failed to copy manifest file"
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_isa_stub
install_smf
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
