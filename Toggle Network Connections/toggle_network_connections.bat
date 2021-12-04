@echo off
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""C:\Program Files\Toggle Network Connections\toggle_network_connections.ps1""' -Verb RunAs}"
