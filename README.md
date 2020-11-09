# Jumper: a throwaway Docker container for ssh jumping

Use this image to setup a one-time use throw-away jump-host container in your Docker instance.

# Usage

- Run `./throwaway_ssh.sh` on your server (or run `docker run --rm -it	-p45678:2222 jumper`)
- Connect with user `jumper` and the password printed to the terminal by the script. For example:	
	```
		ssh -J jumper@your-public-ip:45678 user@your-internal-server
	```
- The container always resets the passord and the public keys, so you may have to use `-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no` or to remove the old keys from `~/.ssh/known_hosts`

# Usage scenarios

- One-time connection from a third-party device to transfer some files
- Temporary expose a service through TCP forwarding without opening other ports on the firewall
- ??

# License

The material in this repository is licensed under the GNU GPL v3 license. See (LICENSE)[LICENSE] for more information.

(C) Massimo Girondi 2020

