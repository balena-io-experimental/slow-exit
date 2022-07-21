# slow-exit
Simulate a service that waits too long to be killed


## Usage

- Clone the repo
```
git clone https://github.com/balena-io-playground/slow-exit.git
cd slow-exit
```
- [Push a release](https://www.balena.io/docs/learn/getting-started/raspberrypi3/nodejs/#create-a-release) using this repository to [balenaCloud](balena.io). This assumes you have a fleet `slow-exit` on your default organization.
```
balena push slow-exit
```
- Provision a device into your `slow-exit` fleet
- Control the time services take to exit using the `WAIT_FOR_EXIT` environment variable.
