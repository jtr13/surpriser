
<!-- README.md is generated from README.Rmd. Please edit that file -->

# surpriser

<!-- badges: start -->
<!-- badges: end -->

## Setting up gmailr

This package will use **gmailr** so you need to set that up first.


1.  Go to <https://console.developers.google.com/apis/library>

2.  If you have more than one Google account, make sure you’re logged in
    the correct one–check the icon on the top right of the screen. It’s
    a good idea to only be logged in to the account that you want to
    use.

3.  Click “Select a project”, “NEW PROJECT”, give it a project name,
    click “Create”. It’s ok if the Location fields says “No
    organization.”

4.  Search for “gmail”, choose Gmail API, and click “Enable”.

5.  Click “Create Credentials” then the following:

**Credential Type**

Choose “Gmail API” for Select an API, choose “User data”, NEXT

**OAuth Consent Screen**

Choose an App name (I don’t think this matters), and a support email
(also doesn’t matter afaik), developer contact info, SAVE AND CONTINUE.

**Scopes (Optional)**

Click SAVE AND CONTINUE

**OAuth Client ID**

Choose “Desktop app” for the Application Type field.

Choose any name or leave “Desktop client 1” for the name field.

Click CREATE

Download the .json file

Click DONE

6. Choose the "OAuth consent screen" tab on the left. Click "PUBLISH APP" under "Testing". Click "Confirm".

Continue with Setup instructions the the [gmailr README.md](https://github.com/r-lib/gmailr) starting wtih "Tell gmailr where the JSON lives,..."
