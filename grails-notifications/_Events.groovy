eventStatusUpdate = { msg ->
    notify('Grails', msg)
}
eventStatusFinal = { msg ->
    notify('Grails', msg)
}
eventStatusError = { msg ->
    notify('Grails', "Error: ${message}")
}
eventExiting = { code ->
    notify('Grails', "Exit; return code $code")
}

void notify(title, message) {
    def notificationsCmds = [
        [
            'growlnotify',
            '-n', 'Grails',
            '-m', "$title: $message",
            '--image', "${System.getenv('GRAILS_HOME')}/media/icons/favicon32.png"
        ],
        [ 
            'notify-send',
             title,
             message,
             '-i', "${System.getenv('GRAILS_HOME')}/doc/img/grails-icon.png"
        ]
    ]
        
    notificationsCmds.each { cmd ->
        if ([ 'which', cmd[0] ].execute().waitFor() == 0) {
            cmd.execute()
        }
    }
}
