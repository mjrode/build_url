# BuildUrl
A script that will take Jenkins output and email you a build url. 

## Install and Setup

### Install the gem
`git clone git@github.com:mjrode/build_url.git`

`cd build_url`

`bundle install`

### Add your email
Add the email address that you want to use to config.yml

## Usage
Run `ruby lib/build_url.rb`

It will prompt you to enter in a line form the Jenkins output and then will email you the appropriate url for that build. 

## Tips
I find it is best to add the following alias to your bash_profile
`vim ~/.bash_profile`

You will need to edit the path to reflect where you installed it.

```# Jenkins url mailer script
 alias url="ruby /Users/mike.rode/Malauzai/projects/build_url/lib/build_url.rb" ```

Now anytime you want to use the script you can type url from any directory and it will run. 

