# fluent-plugin-level-to-keyword

## DISCLAIMER

This plugin is not an offical plugin from FluentD. It is published as is, and without any warranty. Use this software at your own risk.

## Description

This plugin is a FluentD formatter. It formats Level field in records from syslog int levels to syslog keyword levels. It leaves anything else untouched.

## Use case

I wrote this to solve an indexing issue in a clients centralized logging stack. Forwarding messages to Graylog from various sources caused an indexation error
when different types of the same field conflicted