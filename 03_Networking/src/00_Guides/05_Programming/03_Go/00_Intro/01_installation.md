# Install

Step 2: Download and Install Go
First, you will need to download the latest version of the Go tarball from the Go official website. At the time of writing this article, the latest stable version of Go is version 1.12.7.

To download the Go tarball, run the following command:

wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
Once the tarball is downloaded, verify the tarball checksum with the following command:

sha256sum go1.12.7.linux-amd64.tar.gz

You should see an output that looks similar to the one below:

66d83bfb5a9ede000e33c6579a91a29e6b101829ad41fffb5c5bb6c900e109d9

Compare the hash value from the above output to the checksum value on the Go download page. If they match that means the integrity of the file validated and you can proceed with the installation.

Next, extract the downloaded file to the /usr/local directory with the following command:

tar -C /usr/local -xvzf go1.12.7.linux-amd64.tar.gz
Step 3: Edit the Path Variable for Go
Next, we will need to set up the Go path environment variable to execute Go like any other command, no matter where you are in the filesystem.

You can set the environment variable globally by creating a file called go.sh in the /etc/profile.d directory.

nano /etc/profile.d/go.sh
Add the following line:

export PATH=$PATH:/usr/local/go/bin
Save and close the file when you have finished.

If you want to set the Go path environment variable for a specific user, then you will need to define Go environment variables in your user’s .bash_profile file.

nano ~/.bash_profile
Add the following lines:

export GOPATH=$HOME/project
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
Save and close the file. Then, run the source command to reload the updated profiles:

source /etc/profile.d/go.sh
source ~/.bash_profile
Next, verify the Go installation with the following command:

go version
You should see the following output:

go version go1.12.7 linux/amd64
Step 4: Create your First Go Project
Here we will create a sample program in the Go language. First, create a new directory for the Go workspace with the following command:

mkdir $HOME/project
Next, create a new src/test directory inside $HOME/project with the following command:

mkdir -p $HOME/project/src/test
Next, create a simple program (test.go) with the following command:

nano $HOME/project/src/test/test.go
Add the following content:

```
package main

import "fmt"

func main() {
    fmt.Printf("This is my first Go Program\n")
}
```


Save and close the file. Then, compile the program with the following command:

```
cd $HOME/project/src/test/
go build
```


The above command will generate an executable named test. You can now run the program with the following command:

./test
The output should be similar to one below:

This is my first Go Program
That’s it! Now you can use Go to code your programs for any platform.

-----------------------------



# 1. Clean-up everything

If you have have some older versions of Go. Then its necessary to delete that version before installing the new one. We can’t upgrade the version directly.

Run this in your terminal

## To remove go-lang-packages

```
sudo apt-get remove golang-go
```

## To remove all golang dependencies

```
sudo apt-get remove --auto-remove golang-go
```

## Uninstall/remove ( existing ) Golang-go package

```
sudo rm -rvf /usr/local/go
```

# 2. Install (new) Golang-go

Download golang binary release to your machine by running this command in your terminal or you can also download this from [Golang Website](https://golang.org/dl/)

```
wget https://dl.google.com/go/go1.15.5.linux-amd64.tar.gz
```

Note : change the **bold part** according to the version you downloaded (or want)

Extract the archive file by running

```
sudo tar -xvf go1.15.5.linux-amd64.tar.gz
```

Move file to proper location

```
sudo mv go /usr/local
```

Now golang is installed in our system, its time to set the path so that we can use golang without entering whole path.

# 3. Setting up the path & env variable

From the Home directory, open **.profile** file by running

```
vim ~/.profile
```

added following lines to that file

```
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
```

# Kuddos to you xD

Golang-go is now installed and path is also configured in your system. Let’s check it ones, is it properly installed or not by running —

```
go version
```

To check all Env variables

```
go env
```

