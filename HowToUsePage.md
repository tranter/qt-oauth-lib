# Introduction #

This library can be used in Qt4 projects.


# Details #

First you need to register your application in  <a href='https://code.google.com/apis/console'>Google API Console</a>.
Then you have a Client secret, scope of your application, redirect URI. This information is needed to create a OAuth2 object from our library:

```
OAuth2::OAuth2(QWidget* parent)
{
    m_strEndPoint = "https://accounts.google.com/o/oauth2/auth";
    m_strScope = "https://www.googleapis.com/auth/books";
    m_strClientID = "YOUR_CLIENT_ID_HERE";
    m_strRedirectURI = "YOUR_REDIRECT_URI_HERE";
    m_strResponseType = "token";

    m_strCompanyName = "Google"; //You company here
    m_strAppName = "Test Google API Client"; //Your application name here

    m_pLoginDialog = new LoginDialog(parent);
    connect(m_pLoginDialog, SIGNAL(accessTokenObtained()), this, SLOT(accessTokenObtained()));
}
```

In this very simple constructor you set all the details of your application. Then you need to add this library to your project and the usage is as following:

```
Form::Form(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Form)
{
    ui->setupUi(this);


    m_pOAuth2 = new OAuth2(this);
    m_pOAuth2->setScope("https://www.googleapis.com/auth/books");
    m_pOAuth2->setClientID("YOUR_CLIENT_ID");
    m_pOAuth2->setRedirectURI("YOUR_REDIRECT_URI");
    m_pOAuth2->setCompanyName("YOUR_COMPANY_NAME");
    m_pOAuth2->setAppName("YOUR_APPLICATION_NAME");

    connect(m_pOAuth2, SIGNAL(loginDone()), this, SLOT(loginDone()));

    /* Other code of constructor here. */
}

void Form::startLogin(bool bForce)
{
   m_pOAuth2->startLogin(bForce); 
}


void Form::loginDone()
{
    m_booksDataManager.getMyLibraryBookshelves(m_pOAuth2->accessToken());
}


```

Here is the link to <a href='https://developers.google.com/accounts/docs/OAuth2'>Google's description of OAuth API</a>.

**Note:**
This library allows you to get access\_token that expires in 3600 seconds, then you will need to get another access\_token.