#!/bin/bash

# Swap Caps Lock and Left Control
hidutil property --set '{"UserKeyMapping":[
    {
        "HIDKeyboardModifierMappingSrc": 0x700000039,
        "HIDKeyboardModifierMappingDst": 0x7000000E0
    },
    {
        "HIDKeyboardModifierMappingSrc": 0x7000000E0,
        "HIDKeyboardModifierMappingDst": 0x700000039
    }
]}'

# To revert changes:
# hidutil property --set '{"UserKeyMapping":[]}'

# To check current mapping:
# hidutil property --get "UserKeyMapping"
