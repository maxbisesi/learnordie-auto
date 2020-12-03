@Regression
@User
Feature: Chum tab

    @FCSisShown
    Scenario: The user opens the App, Login is the first tab (FCSisShown)
        When The user navigates to FlashCardShark
        And The user uses the app as a Guest
        Then The "Login" Tab is shown
        And The user switches to the "Home" Tab
        And The user switches to the "Chum" Tab
        And The user switches to the "Test" Tab

    @UserGuestUserAddCards
    Scenario: Guest users can add Cards, Study Cards, see catogries and Filter, but that's it (UserGuestUserAddCards)
        When The user navigates to FlashCardShark
        And The user uses the app as a Guest
        And The user switches to the "Chum" Tab
        And The user fills the form with the following values:
            | Field Name | Value              |
            | Card       | SeleniumTestCard   |
            | Answer     | SeleniumTestAnswer |
            | Category   | randomCategory     |
        Then The form matches the following values:
            | Field Name | Value              |
            | Card       | SeleniumTestCard   |
            | Answer     | SeleniumTestAnswer |
            | Category   | randomCategory     |
        And The user clicks the "Submit" button
        # Animation should play and TextAreas should be cleared if this worked
        # Category doesn't get cleared though
        Then The form matches the following values:
            | Field Name | Value          |
            | Card       |                |
            | Answer     |                |
            | Category   | randomCategory |
        And The user switches to the "Home" Tab
        Then The following Categories are shown:
            | Field Name     | Value |
            | randomCategory | 1     |
        When The user deletes the "randomCategory" Category
        Then The following Categories are not shown:
            | Category       |
            | randomCategory |


    @UserGuestCardsSavedonRegister
    Scenario: If guest user adds some cards then registers, their cards get saved and are accessible (UserGuestCardsSavedonRegister)
        When The user navigates to FlashCardShark
        And The user uses the app as a Guest
        And The user switches to the "Chum" Tab
        And The user fills the form with the following values:
            | Field Name | Value                       |
            | Card       | What's a QA's goal in life? |
            | Answer     | Not quality, Equality.      |
            | Category   | randomCategory              |
        Then The form matches the following values:
            | Field Name | Value                       |
            | Card       | What's a QA's goal in life? |
            | Answer     | Not quality, Equality.      |
            | Category   | randomCategory              |
        And The user clicks the "Submit" button
        Then The form matches the following values:
            | Field Name | Value          |
            | Card       |                |
            | Answer     |                |
            | Category   | randomCategory |
        And The user fills the form with the following values:
            | Field Name | Value                      |
            | Card       | How many Dev's equal a QA? |
            | Answer     | 1 QA for every 4 Devs      |
        Then The form matches the following values:
            | Field Name | Value                      |
            | Card       | How many Dev's equal a QA? |
            | Answer     | 1 QA for every 4 Devs      |
        And The user clicks the "Submit" button
        Then The form matches the following values:
            | Field Name | Value          |
            | Card       |                |
            | Answer     |                |
            | Category   | randomCategory |
        And The user switches to the "Home" Tab
        Then The following Categories are shown:
            | Field Name     | Value |
            | randomCategory | 2     |
        And The user switches to the "Login/Profile" Tab
        And The user clicks the "Come Aboard" button
        And The user fills the form with the following values:
            | Field Name | Value                |
            | username   | randomusername       |
            | password   | lodqa0828            |
            | confirm    | lodqa0828            |
            | email      | max.bisesi@gmail.com |
        And The user clicks the "Choose Your Destiny" button
        Then The form matches the following values:
            | Field Name | Value          |
            | Username   | randomusername |
            | Rank       | Recruit        |
            | Points     | 0              |
        And The user switches to the "Home" Tab
        Then The following Categories are shown:
            | Field Name     | Value |
            | randomCategory | 2     |
        When The user deletes the "randomCategory" Category
        Then The following Categories are not shown:
            | Category       |
            | randomCategory |


    @currentUserAddsCardsAsGuest
    Scenario: If a current user adds cards then logs in, those cards are saved and accessible. (currentUserAddsCardsAsGuest)
        When The user navigates to FlashCardShark
        And The user uses the app as a Guest
        And The user switches to the "Chum" Tab
        And The user fills the form with the following values:
            | Field Name | Value                         |
            | Card       | Why did you forget to log in? |
            | Answer     | Because this test will pass   |
            | Category   | randomCategory                |
        Then The form matches the following values:
            | Field Name | Value                         |
            | Card       | Why did you forget to log in? |
            | Answer     | Because this test will pass   |
            | Category   | randomCategory                |
        And The user clicks the "Submit" button
        Then The form matches the following values:
            | Field Name | Value          |
            | Card       |                |
            | Answer     |                |
            | Category   | randomCategory |
        And The user switches to the "Login/Profile" Tab
        And The user logs in as: "QATestUser"
        And The user switches to the "Home" Tab
        Then The following Categories are shown:
            | Field Name     | Value |
            | randomCategory | 1     |
        When The user deletes the "randomCategory" Category
        Then The following Categories are not shown:
            | Category       |
            | randomCategory |

    @UserSessionSavedLogout
    Scenario: Session is saved after logging out (UserSessionSavedLogout)
        When The user navigates to FlashCardShark
        And The user logs in as: "QATestUser"
        And The user switches to the "Home" Tab
        And The user clicks the "Logout" button
        Then The form matches the following values:
            | Field Name                   | Value  |
            | Brave the Treacherour Waters | exists |

# @UserRanksUp
# Scenario: Users are promoted if they earn the next rank (UserRanksUp)
#     When The user navigates to FlashCardShark
#     And The user logs in as: "QATestUser"


# Scenario: Newly registered users are given the Recruit rank after register.

# Scenario: A user can activate Modules in their profile