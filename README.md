andrewrothstein.pulumi
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-pulumi.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-pulumi)

Installs [pulumi](https://www.pulumi.com/).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.pulumi
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
