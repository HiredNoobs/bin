#!/usr/bin/env bash
echo "$(playerctl metadata --format '{{title}}      {{artist}}')"
