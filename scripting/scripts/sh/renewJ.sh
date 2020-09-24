#!/bin/bash

rm ~/.WebStorm*/config/eval/WebStorm*.evaluation.key
sed -i '/evlsprt/d' ~/.WebStorm*/config/options/other.xml
rm -rf ~/.java/.userPrefs/jetbrains