@Regression
@e2e
Feature: Create, Organize, and Delete FlashCards
    Tests that cover complete full use Cases. Not limited to one specific Tab or function

    @DeleteCardSetKeepCards
    Scenario: On the Chum tab User creates a new FlashCard (ChumNewCard)
        When The user navigates to FlashCardShark
        And The user logs in as: "QATestUser"
        And The user switches to the "Galley" Tab
        And The user selects the following question cards:
            | Question                                                    |
            | Is this the mailroom ? (Shoulda Sent it Sooner)             |
            | You guys hiring ? (Birchum Security Guard)                  |
            | What was your dad doing slinging hash state side ?          |
            | Did Lenny ever let go ? (Birchum Bounty Hunter)             |
            | How many lunchables can that kid eat ? (Birchum Pop Warner) |
        Then The form matches the following values:
            | Field Name              | Value |
            | Card Set size indicator | 5     |
        And The user clicks the "Save to Set" button
        And The user fills the form with the following values:
            | Field Name    | Value                           |
            | Card Set Name | Yankers                         |
            | Description   | Award-Winning, World - renowned |
        And The user clicks the "Save" button
        And The user deletes the "Yankers" Card Set
        And The user switches to the "Home" Tab
        Then The following Categories are shown:
            | Field Name             | Value |
            | Shoulda Sent it Sooner | 1     |
            | Birchum Security Guard | 1     |
            | Birchum Bounty Hunter  | 1     |
            | Birchum Pop Warner     | 1     |