# Couchbase CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/couchbase"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Couchbase server with CI/CD on Elestio

<img src="couchbase.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can can open Couchebase UI here:

    URL: https://[CI_CD_DOMAIN]
    Login: root
    password: [ADMIN_PASSWORD]

# Configuring SMTP Server

To configure the SMTP server, click on Settings in the left menu, then on the Alert tab.

<img src="./steps/step-01.png" style='width: 300px; max-width:100%;'/>
<img src="./steps/step-02.png" style='width: 300px; max-width:100%;'/>

Enable the Enable email alerts option, then enter the following credentials:

        Email Server Host:[EMAIL_HOST]
        Port: [EMAIL_PORT]
        Username and Password must be empty
        Require encryption (TLS) must not be checked
        Sender Email: [DEFAULT_FROM_EMAIL]

<img src="./steps/step-03.png" style='width: 300px; max-width:100%;'/>

In the Recipients field, you can put your email address to do a test by clicking on Send Test Email.

When done, click Save.

<img src="./steps/step-04.png" style='width: 300px; max-width:100%;'/>
