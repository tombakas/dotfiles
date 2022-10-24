lua << EOF
leap = require('leap')
leap.add_default_mappings()

leap.opts.special_keys.prev_group = '<S-tab>'
leap.opts.special_keys.next_group = '<tab>'
EOF
