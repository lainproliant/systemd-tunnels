SSH tunnel service scripts, based on the helpful [guide](https://medium.com/linuxstories/linux-how-to-create-an-ssh-tunnel-as-a-systemd-service-73e6e0fff19b) by Konstantinos Patronas.

## Setup
Run the `./install.sh` script included in this repo.

## Configuration Steps
See `./examples` for config file examples.  Follow the guides below to setup forward or reverse tunnels.

### Forward Tunnels
1. Decide on a name for your tunnel, i.e. `example.com`.
2. Create a config file at `/etc/default/ssh-forward-tunnel@example.com.conf` with the following variables set:
    - `RUNAS_USER=your_username`
        - This is the user the tunnel will run as, can influence which SSH keys
          are used to connect by default and prevents the tunnel running as `root`.
    - `TARGET=example.com`
        - This is the remote SSH target host you are reaching out to in order to establish the tunnel.
    - `TUSER=your_remote_username`
        - Your username on the SSH target host.
    - `LOCAL_PORT=2525`
        - This is the local port for which TCP should be forwarded to the remote host.
    - `REMOTE_HOST=localhost`
        - This is the remote host which TCP on the local port should be redirected to.  This is `localhost` if the remote host and target SSH host are the same machine.
    - `REMOTE_PORT=8080`
        - This is the port on the remote host that TCP from LOCAL_PORT will be redirected to.
3. Enable the service: `sudo systemctl enable ssh-forward-tunnel@example.com`.

### Reverse Tunnels
1. Decide on a name for your tunnel, i.e. `example.com`.
2. Create a config file at `/etc/default/ssh-forward-tunnel@example.com.conf` with the following variables set:
    - `RUNAS_USER=your_username`
        - This is the user the tunnel will run as, can influence which SSH keys
          are used to connect by default and prevents the tunnel running as `root`.
    - `TARGET=example.com`
        - This is the remote SSH target host you are reaching out to in order to establish the reverse tunnel.
    - `TUSER=your_remote_username`
        - Your username on the SSH target host.
    - `LOCAL_PORT=8080`
        - This is the local port which TCP will be redirected to through the tunnel from the remote host's REMOTE_PORT.
    - `REMOTE_HOST=localhost`
        - This is the remote host which TCP on the local port should be redirected to.  This is `localhost` if this machine and the reverse tunneling target are the same, which is the most likely case for remote forwarding like this.
    - `REMOTE_PORT=2525`
        - This is the port on the remote host that TCP from LOCAL_PORT will be redirected to.
3. Enable the service: `sudo systemctl enable ssh-reverse-tunnel@example.com`.
