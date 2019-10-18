## Role Name

Configures MOTD(Message of the day) on RHEL/CentOS 7/8 servers.

## Requirements

No special requirements; note that this role requires root access, so either run it in a playbook with a global `become: yes`, or invoke the role in your playbook like:

    - hosts: all
      roles:
        - role: bilalcaliskan.motd
          become: yes

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

        message: Your custom message

## Dependencies

None

## Example Playbook

    - hosts: all
      become: yes
      roles:
        - { role: bilalcaliskan.motd }

*Inside `vars/main.yml`*:

        message: Your custom message

## License

MIT / BSD
