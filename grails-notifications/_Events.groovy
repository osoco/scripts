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
    def cmd = [
        'notify-send',
        title,
        message,
        '-i', "${System.getenv('GRAILS_HOME')}/doc/img/grails-icon.png"
    ]
    cmd.execute()
}