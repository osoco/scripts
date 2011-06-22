grails

* **Description**: a script to work with different grails versions simultaneously
* **Dependencies**: 
  * grails (one or more installations)
* **Usage**:
  The script will use the grails version found in the application.properties file
  in the current directory. If none found, the default installation will be used.
  Put the script in your path with more precedence than any grails installation.
  For example, put it into $HOME/bin and at the end of your $HOME/.profile, add
  the following:

        export PATH="$HOME/bin/:$PATH"

* Put any of your Grails installations in $HOME/local, /opt, or /usr/local (this
  can be changed editing the variable WHERE_TO_LOOK_FOR_GRAILS_INSTALLATIONS). Example:

       	/home/user/local/grails-1.3.5
        /home/user/local/grails-1.2.1
        /opt/grails

* The installation named grails will be used as default (can be changed editing
  the variable DEFAULT_GRAILS_INSTALLATION_NAME).
