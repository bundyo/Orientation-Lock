#!/bin/sh

mkdir /home/user/.config/OrientationLock/
chown user:users mkdir /home/user/.config/OrientationLock/
chown user:users /opt/orientationlock/icons/*
cp /opt/orientationlock/icons/unlocked.png /home/user/.config/OrientationLock/current.png

exit 0
