# By Arch for Arch



## Creating VM

To create an Arch VM in Arch, run:

```shell
$SHELL createArchVM.sh
```


## Username and Password

Default username and password is arch/arch.
Edit the cloud-init to change username and/or password.
Passwd accepts prehashed password with using SHA-512.

```shell
mkpasswd --method=SHA-512 [password]
```

You may also use plain_text_passwd with plaintext passwords.


## Destroy VM

To destroy the VM, run:

```shell 
virsh destroy arch-vm; virsh undefine arch-vm --remove-all-storage
```
