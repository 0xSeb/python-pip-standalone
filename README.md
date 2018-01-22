# Python-pip-standalone
Bash script which can **bundle all your pip dependencies** to make it easy to **export your python script** on other system without having to install anything. 

# How to use 

You need to have python and python pip installed.

Install the following pip dependencies : 
  
* pipreqs (to create the requirements.txt)

* pip-bundle (which will be used to get the dependencies of your script)

```
  sudo pip install pip-bundle
  sudo pip install pipreqs
```

* Create a new folder and copy your python file and this script inside.

* Run the bash script (may need to make it executable)

```
  sudo chmod +x bundle.sh
  ./bundle.sh
```

**Now you just have to copy the newly created folders (containing your pip dependencies) and your python file on any environement and you won't have to install them to execute it.**

# Enjoy !
