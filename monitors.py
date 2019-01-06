#!/usr/bin/env python
#-*- coding: utf-8 -*-

import os
import subprocess


monitors = ['DP-4', 'DVI-D-0', 'DP-2']
primary = 'DP-4'
tv = ['HDMI-0']

positions = {
    # 'HDMI-0': '0x0',
    'DP-4': '0x0',
    'DP-2': '3840x1080',
    'DVI-D-0': '3840x0',
}

# positions = {}

def connected_screens():
    tv_off = False
    output = [l for l in subprocess.check_output(["xrandr"]).decode("utf-8").splitlines()]
    for l in output:
        if l == 'HDMI-0 connected (normal left inverted right x axis y axis)': tv_off = True

    scrren_list =  [l.split()[0] for l in output if " connected " in l]
    if tv_off: scrren_list.remove(tv[0])
    return scrren_list


def turn_off(displays):
    cmd = []
    for item in displays:
        cmd = cmd + ['--output', item, '--off']
    return cmd
    # subprocess.check_call(cmd)

def turn_on(displays):
    cmd = []
    for item in displays:
        cmd = cmd + ['--output', item]
        if item == primary: cmd.append('--primary')
        if item in positions: 
            cmd = cmd + ['--auto', '--pos', positions[item]]
        else: 
            cmd.append('--auto')
    return cmd
    # subprocess.check_call(cmd)


screens = connected_screens()
run = []


if tv[0] in screens:
    # Only TV connected
    print('Connecting monitors')
    run = ['xrandr'] + turn_off(tv) + turn_on(monitors)
else:
    # Only Monitors connected
    primary = tv[0]
    print('Connecting TV')
    run = ['xrandr'] + turn_on(tv) + turn_off(monitors)

if run:
    print('new settings')
    print(' '.join(run))
    print()
    subprocess.check_call(['xrandr', '--auto'])
    subprocess.check_call(run)

# xrandr --output HDMI-0 --primary --pos 0x0 --output DP-0 --off --output DVI-D-0 --off --output DP-1 --off
# xrandr --output DP-0 --primary --pos 0x0 --output DVI-D-0 --pos 3840x0 --output DP-2 --pos 3840x1080 --output HDMI-0 --off
