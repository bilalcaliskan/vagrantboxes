## Role Name

Installs and configures Zookeeper cluster on RHEL/CentOS 7/8 servers.

## Requirements

No special requirements; note that this role requires root access, so either run it in a playbook with a global `become: yes`, or invoke the role in your playbook like:

    - hosts: all
      roles:
        - role: bilalcaliskan.zookeeper
          become: yes

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

        zookeeper_version: 123.123

## Dependencies

None

## Example Playbook

    - hosts: all
      become: yes
      roles:
        - { role: bilalcaliskan.zookeeper }

*Inside `vars/main.yml`*:

        zookeeper_version: 123.123

## License

MIT / BSD
