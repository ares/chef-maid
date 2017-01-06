Description
===========

Cookbook for cleaning files using Maid

Requirements
============

users cookbook to find out the user

Usage
=====

Just include `maid` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[maid]"
  ]
}
```

